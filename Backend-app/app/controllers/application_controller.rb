class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  after_filter :cors_set_access_control_headers
  protect_from_forgery with: :exception
  rescue_from Exceptions::MalformedRequestException do |e|
    render json: {status: 400, msg: "Parameters were not formated correctly", exception: "MalFormedRequest"}
  end


 def cors_set_access_control_headers
   headers['Access-Control-Allow-Origin']      = '*'
   headers['Access-Control-Allow-Methods']     = 'GET'
   headers['Access-Control-Max-Age']           = '1728000'
   headers['Access-Control-Allow-Credentials'] = 'true'
 end

end
