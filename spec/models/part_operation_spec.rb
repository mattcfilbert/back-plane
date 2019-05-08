require 'rails_helper'

RSpec.describe PartOperation, type: :model do
  it { should belong_to(:part) }
  it { should have_many(:production_operations).dependent(:destroy) }


  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:number) }
end
