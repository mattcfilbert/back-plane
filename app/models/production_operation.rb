class ProductionOperation < ApplicationRecord
  belongs_to :produceable, polymorphic: true

  validates_presence_of :complete
end
