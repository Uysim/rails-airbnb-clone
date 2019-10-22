class RoomSerializer < ApplicationSerializer
  attributes :name, :image

  def image
    object.image_url
  end
end
