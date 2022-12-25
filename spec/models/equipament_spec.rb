require 'rails_helper'

RSpec.describe Equipament, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:kind) }

  describe "associations" do
    it { is_expected.to belong_to(:place) }
  end
end
