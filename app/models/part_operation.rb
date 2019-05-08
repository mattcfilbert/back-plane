class PartOperation < ApplicationRecord
  belongs_to :part
  has_many :production_operations, as: :produceable, dependent: :destroy

  validates_presence_of :name, :number
end
