# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :verify_authenticity_token, if: :json_request?

  def json_request?
    request.format.json?
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
