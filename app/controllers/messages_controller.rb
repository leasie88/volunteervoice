class MessagesController < ApplicationController
include ActionView::Helpers::TextHelper
  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    @message.recipient_id = params[:recipient_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @message }
    end
  end
  
  def index
    @messages = Message.find(:all, :order => "created_at").reverse
  end


  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.body = RedCloth.new( ActionController::Base.helpers.sanitize( @message.body ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
    @recipient = User.find(@message.recipient_id)
    @recipient.unread_messages = @recipient.unread_messages + 1
    @recipient.save
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to "/users/#{@message.recipient_id}", :notice =>'Message was sent' }
        format.json { render :json => @message, :status => :created, :location => @message }
      else
        @message.body = @message.body.gsub(%r{</?[^>]+?>}, '')
        format.html { render :action => "new" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    
    respond_to do |format|
      format.html { redirect_to "/pages/profile" }
      format.json { head :no_content }
    end

  end
  
  def mark_sent_deleted
    @message = Message.find(params[:id])
    @message.sender_deleted = true
    @message.save
    redirect_to "/pages/profile/sent_deleted"
  end
  
  def mark_deleted
    @message = Message.find(params[:id])
    @message.recipient_deleted = true
    @message.save
    redirect_to "/pages/profile/message_deleted" 
  end
  
end
