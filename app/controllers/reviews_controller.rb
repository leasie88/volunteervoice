class ReviewsController < ApplicationController

  
   def create
     if user_signed_in?
      @review = Review.new(params[:review])
      @review.truncated100 = RedCloth.new( ActionController::Base.helpers.sanitize( (@review.body[0..99] + "...") ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
       @review.truncated200 = RedCloth.new( ActionController::Base.helpers.sanitize( (@review.body[0..199] + "...") ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
      if !(params[:body].nil?)
        @review.body = params[:body].html_safe
      end
      if !(params[:time_frame].nil?)
        @review.time_frame = params[:time_frame]
      end
      @review.body = RedCloth.new( ActionController::Base.helpers.sanitize( @review.body ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
      @review.organization_id = Organization.where(:name => @review.organization_name).first.id
      
      @user_review_orgs = []
      if !(current_user.reviews.empty?)
        current_user.reviews.each do |f|
          @user_review_orgs << f.organization_id
        end
      end
    if !(@user_review_orgs.include?(@review.organization_id))
       respond_to do |format|
         if @review.save
           @prog = Program.find(@review.program_id)
            @prog.overall = (((@prog.overall.to_f)*(@prog.reviews.count.to_f) + @review.overall.to_f)/(@prog.reviews.count.to_f + 1))
            @prog.save
            @org = Organization.find(@review.organization_id)
             @org.overall = (((@org.overall.to_f)*(@org.reviews_count.to_f) + @review.overall.to_f)/(@org.reviews_count.to_f + 1))
             @org.reviews_count = @org.reviews_count + 1
             @org.save
             format.html { redirect_to "/pages/thank_you_review" }
              format.json { render json: @review, status: :created, location: @review }
         else
           flash[:notice] = flash[:notice].to_a.concat @review.errors.full_messages
           format.html { render :action => "new" }
           format.json { render :json => @review.errors, :status => :unprocessable_entity }
         end
       end
       else
         redirect_to "/reviews/already_reviewed"
       end
     else
       redirect_to "/registrations/mustBe"
     end
    end
    
    def index
      if (user_signed_in? && current_user.admin?)
      @reviews = Review.all.reverse

      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @reviews }
      end
    else
      redirect_to root_path
    end
    end
    

     def show
       @review = Review.find(params[:id])

       respond_to do |format|
         format.html # show.html.erb
         format.json { render :json => @review}
       end
     end

     def new
       @review = Review.new
       if user_signed_in?
       @review.organization_id = params[:organization_id]
       respond_to do |format|
         format.html # new.html.erb
         format.json { render :json => @review }
       end
     else
       redirect_to "/registrations/mustBe"
     end
     end

     def edit
       @review = Review.find(params[:id])
       respond_to do |format|
         format.html # new.html.erb
         format.json { render :json => @review }
       end
     end

     def update
       @review = Review.find(params[:id])
        @review.truncated100 = RedCloth.new( ActionController::Base.helpers.sanitize( (params[:review][:body][0..99] + "...") ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
        @review.truncated200 = RedCloth.new( ActionController::Base.helpers.sanitize( (params[:review][:body][0..199] + "...") ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html

        params[:review][:body] = "<span style='color:#6aaeba>Update #{Time.now.to_date.strftime("%m/%e/%Y").gsub(/^0/, '')}:</span> "+RedCloth.new( ActionController::Base.helpers.sanitize( params[:review][:body] ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html + "<br />"+@review.body
       
       if user_signed_in? && (current_user.admin? || current_user.id == @review.user_id)

         respond_to do |format|
           if @review.update_attributes(params[:review])
             @review.save
             format.html { redirect_to "/pages/profile", :notice => 'Review Submitted' }
             format.json { head :no_content }
           else
             format.html { render :action => "edit" }
             format.json { render :json => @review.errors, :status => :unprocessable_entity }
           end
         end
       else
         redirect_to root_path
       end
     end

     def destroy
        @review = Review.find(params[:id])
        if (user_signed_in? && (current_user.admin? || current_user.id == @review.user_id))
         @review_id = @review.program_id
         @field = params[:field]
         @location = params[:location]
         @org = Organization.find(@review.organization_id)
         @prog = Program.find(@review.program_id)
         @org.overall = (@org.overall * @org.reviews_count - @review.overall) / (@org.reviews_count - 1)
         @prog.overall = (@prog.overall * @prog.reviews.count - @review.overall) / (@prog.reviews.count - 1)
         @org.save
         @prog.save
         
         @review.destroy

         respond_to do |format|
           if current_user.admin?
             format.html { redirect_to reviews_path }
           else
             format.html { redirect_to "/pages/profile" }
           end
           format.json { head :no_content }
         end
       else
         redirect_to root_path
       end

     end
     
     def make
       @review = Review.find(params[:id])
        respond_to do |format|
          format.html # new.html.erb
          format.json { render :json => @review }
        end
      end
      
  def changeShow
      if (user_signed_in? && current_user.admin?)
        @review = Review.find(params[:id])
        if @review.show
          @review.show = false
          @review.save
        else
          @review.show = true
          @review.save
        end
          respond_to do |format|
            format.html {redirect_to reviews_path}
          end
      else
        redirect_to root_path
      end
  end
  
  def already_reviewed
  end

end
