class ProductionOperation < ApplicationRecord
  belongs_to :produceable, polymorphic: true, optional: true

  validates_presence_of :complete
end
