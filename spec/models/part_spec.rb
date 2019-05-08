require 'rails_helper'

RSpec.describe Part, type: :model do
  it { should have_many(:work_order_lines).dependent(:destroy) }
  it { should have_many(:part_operations).dependent(:destroy) }

  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:name) }

end
