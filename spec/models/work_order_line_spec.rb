require 'rails_helper'

RSpec.describe WorkOrderLine, type: :model do
  it { should belong_to(:workable) }
  it { should have_many(:production_operations).dependent(:destroy) }

  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:released) }
  it { should validate_presence_of(:complete) }
end
