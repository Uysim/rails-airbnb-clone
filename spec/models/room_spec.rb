require 'rails_helper'

RSpec.describe Room, type: :model do
  it { is_expected.to belong_to(:property) }
  it { is_expected.to validate_presence_of(:name) }
end
