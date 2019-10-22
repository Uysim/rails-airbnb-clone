module RequestHelpers
  def build_jsonapi_params(type, relationships: {}, **params)
    {
      data: {
        type: type.to_s,
        attributes: params,
        relationships: relationships
      }
    }
  end

  def json_response
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include RequestHelpers
end
