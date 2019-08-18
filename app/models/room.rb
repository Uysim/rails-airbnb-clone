class Room < ApplicationRecord
  belongs_to :property

  include ImageUploader::Attachment.new(:image)
  validates :name, presence: true
end
