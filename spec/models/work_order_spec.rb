require 'rails_helper'

RSpec.describe WorkOrder, type: :model do
  it { should have_many(:work_order_lines).dependent(:destroy) }

  it { should validate_presence_of(:work_order_number) }
  it { should validate_presence_of(:customer) }
  it { should validate_presence_of(:customer_order_number) }
  it { should validate_presence_of(:status) }
end
