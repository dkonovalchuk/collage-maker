class Api::ApiController < ApplicationController
  respond_to :json
  layout false

  rescue_from Exception, with: :error_handle

  protected

  def error_handle(error)
    render json: { error: error.message}, status: :bad_request
  end
end
