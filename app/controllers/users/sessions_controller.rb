class Users::SessionsController < DeviseTokenAuth::SessionsController
  protected

  # https://github.com/lynndylanhurley/devise_token_auth/blob/master/app/controllers/devise_token_auth/sessions_controller.rb#L97
  def render_create_success
    render json:  @resource.build_auth_header(@token, @client_id)
  end
end
