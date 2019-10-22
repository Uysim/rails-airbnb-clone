require 'rails_helper'

RSpec.describe Property, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:rooms) }
  it { is_expected.to validate_presence_of(:name) }
end
