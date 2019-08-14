require "rails_helper"

RSpec.describe "Rooms API" do
  it "create room successfully" do
    user = create(:user)
    property = create(:property, user: user)

    params = build_jsonapi_params(
      :room,
      name: "Testing room",
      relationships: {
        property: {
          data: {
            type: "property",
            id: property.id
          }
        }
      }
    )

    post "/api/v1/rooms", headers: user.create_new_auth_token, params: params

    expect(response).to have_http_status(:created)
  end

  it "update room successfully" do
    room = create(:room)
    user = room.property.user

    params = build_jsonapi_params(
      :room,
      name: "Updated room"
    )

    put "/api/v1/rooms/#{room.id}", headers: user.create_new_auth_token, params: params

    expect(response).to have_http_status(:success)
  end

  it "show room detail" do
    room = create(:room)
    user = room.property.user

    get(
      "/api/v1/rooms/#{room.id}",
      headers: user.create_new_auth_token
    )

    expect(response).to have_http_status(:success)
  end

  it "delete room successfully" do
    room = create(:room)
    user = room.property.user

    delete "/api/v1/rooms/#{room.id}", headers: user.create_new_auth_token

    expect(response).to have_http_status(:success)
  end
end
