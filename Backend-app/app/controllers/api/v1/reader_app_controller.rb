  class Api::V1::ReaderAppController < ApplicationController
  skip_before_action :verify_authenticity_token
  def receive_data
    if params[:file_name].nil? || params[:file_info.nil?]
      raise Exceptions::MalformedRequestException
    else
      ##This should be done in background also.
      ProcessedFile.assert_data(params[:file_name], params[:file_info])
      render json: {status: 200, msg: "#{params[:file_name]} created"}
    end
  end
end
