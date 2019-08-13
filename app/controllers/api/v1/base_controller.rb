require "api_responder"
module Api
  module V1
    class BaseController < ActionController::API

      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!

      self.responder = ApiResponder
      respond_to :json
    end
  end
end
