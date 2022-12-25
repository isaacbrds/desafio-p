require 'rails_helper'

RSpec.describe Place, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  describe "associations" do
    it { is_expected.to have_many(:equipaments) }
    it { is_expected.to belong_to(:parent).optional }
  end
end
