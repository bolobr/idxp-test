class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from Exceptions::MalformedRequestException do |e|
    render json: {status: 400, msg: "Parameters were not formated correctly", exception: "MalFormedRequest"}
  end

end
