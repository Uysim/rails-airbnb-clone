class Property < ApplicationRecord
  belongs_to :user
  has_many :rooms

  validates :name, presence: true
end
