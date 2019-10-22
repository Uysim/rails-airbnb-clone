class PropertySerializer < ApplicationSerializer
  attributes :name, :address, :floors
  has_many :rooms
end
