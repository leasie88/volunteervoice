class OrganizationAccountsController < ApplicationController
  
  
  # GET /organization_accounts
  # GET /organization_accounts.json
  def index
    @organization_accounts = OrganizationAccount.all
    
    if user_signed_in? && current_user.admin?
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @organization_accounts }
      end
    else
      redirect_to root_path
    end
  end

  # GET /organization_accounts/1
  # GET /organization_accounts/1.json
  def profile
    if organization_account_signed_in?
      @organization_account = current_organization_account
      @organization = Organization.find(@organization_account.organization_id)
    
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @organization_account }
      end
    else
      redirect_to root_path
    end
  end

  # GET /organization_accounts/new
  # GET /organization_accounts/new.json
  def new
    @organization_account = OrganizationAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization_account }
    end
  end

  # PUT /organization_accounts/1
  # PUT /organization_accounts/1.json
  def update
    @organization_account = OrganizationAccount.find(params[:id])

    respond_to do |format|
      if @organization_account.update_attributes(params[:organization_account])
        format.html { redirect_to @organization_account, notice: 'Organization account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_accounts/1
  # DELETE /organization_accounts/1.json
  def destroy
    @organization_account = OrganizationAccount.find(params[:id])
    @organization_account.destroy

    respond_to do |format|
      format.html { redirect_to organization_accounts_url }
      format.json { head :no_content }
    end
  end
  
  def change_subscription
    @organization_account = OrganizationAccount.find(params[:id])
    @organization_account.notify = !@organization_account.notify unless @organization_account.notify.nil?
    @organization_account.save
    respond_to do |format|
      format.html {render :action => "successful_unsubscribe", :organization_account_id => @organization_account.id}
      format.json {head :no_content}
    end
  end
  
  
  def successful_unsubscribe
    @organization_account = OrganizationAccount.find(params[:organization_account_id])
    if @organization_account.notify = nil
      @notify = false
    else
      @notify = @organization_account.notify
    end
    if @notify
      @subscription_status = "subscribed"
    else
      @subscription_status = "unsubscribed"
    end
    respond_to do |format|
      format.html
      format.json {head :no_content}
    end
  end
  
end
