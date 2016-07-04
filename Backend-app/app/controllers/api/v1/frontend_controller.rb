class Api::V1::FrontendController < ApplicationController
  skip_before_action :verify_authenticity_token
  def search_term
    if params[:term].nil?
      raise Exceptions::MalformedRequestException
    else
      ##Idealisticaly This should be done outside this server but for a faster development will be done inside
      word_files = Term.find_all_files(params[:term])
      render json: {files: word_files}
    end
  end
end
