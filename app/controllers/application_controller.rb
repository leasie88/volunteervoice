class ApplicationController < ActionController::Base
  protect_from_forgery
  
include SimpleCaptcha::ControllerHelpers

   def after_sign_in_path_for(resource)
       if request.referrer
         if ((URI(request.referrer).path == '/users/sign_in') || (URI(request.referrer).path == '/registrations/mustBe')) || (URI(request.referrer).path == '/sign_up') || (URI(request.referrer).path == '/sign_in') || (URI(request.referrer).path == '/users/sign_up')
           '/'
         else
           request.referrer
         end
       else
         '/'
       end
   end
   
   def after_sign_out_path_for(resource)
     if URI(request.referrer).path == '/registrations/mustBe'
       '/'
     else
       if URI(request.referrer).path == '/reviews/new'
         '/'
       else
         if URI(request.referrer).path == '/users/profile'
           '/'
         else
           request.referrer
         end
       end
    end
   end

   
   unless Rails.application.config.consider_all_requests_local
       rescue_from Exception, with: :render_500
       rescue_from ActionController::RoutingError, with: :render_404
       rescue_from ActionController::UnknownController, with: :render_404
       rescue_from ActionController::UnknownAction, with: :render_404
       rescue_from ActiveRecord::RecordNotFound, with: :render_404     
       rescue_from NoMethodError, with: :render_404
   end
     private
     def render_404(exception)
       @not_found_path = exception.message
         respond_to do |format|
           format.html { render template: 'errors/error_404', layout: 'layouts/application', status: 404 }
           format.all { render nothing: true, status: 404 }
         end
        
     end

     def render_500(exception)
       @error = exception
       respond_to do |format|
         format.html { render template: 'errors/error_500', layout: 'layouts/application', status: 500 }
         format.all { render nothing: true, status: 500}
       end
     end
   
end
