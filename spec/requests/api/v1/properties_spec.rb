require "rails_helper"

RSpec.describe "Properties API" do
  it "list all belonging properties" do
    user = create(:user)
    create_list(:property, 5, user: user)

    get "/api/v1/properties", headers: user.create_new_auth_token

    expect(response).to have_http_status(:success)
  end

  it "show property detail" do
    user = create(:user)
    property = create(:property, name: "Testing Property", user: user)

    get "/api/v1/properties/#{property.id}", headers: user.create_new_auth_token

    expect(response).to have_http_status(:success)
    expect(json_response.dig("data", "attributes", "name")).to eq("Testing Property")
  end

  it "create property successfully" do
  	user = create(:user)

  	params = build_jsonapi_params(
      :property,
  		name: "Testing Property"
  	)

  	post "/api/v1/properties", headers: user.create_new_auth_token, params: params

    expect(response).to have_http_status(:created)
  end

  it "update property successfully" do
    user = create(:user)
    property = create(:property, name: "Testing Property", user: user)

    params = build_jsonapi_params(
      :property,
  		name: "Updated Property"
  	)

    put "/api/v1/properties/#{property.id}", params: params, headers: user.create_new_auth_token

    expect(response).to have_http_status(:success)
    expect(json_response.dig("data", "attributes", "name")).to eq("Updated Property")
  end

  it "delete property successfully" do
    user = create(:user)
    property = create(:property, name: "Testing Property", user: user)

    delete "/api/v1/properties/#{property.id}", headers: user.create_new_auth_token

    expect(response).to have_http_status(:success)
  end
end
