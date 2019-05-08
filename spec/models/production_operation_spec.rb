require 'rails_helper'

RSpec.describe ProductionOperation, type: :model do
  it { should belong_to(:produceable) }

  it { should validate_presence_of(:complete) }
end
