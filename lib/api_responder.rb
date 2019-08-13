class ApiResponder < ActionController::Responder
  protected
  def api_behavior
    if put? || patch?
      display resource, status: :ok, location: api_location
    else
      super
    end
  end
end
