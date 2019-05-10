class WorkOrderLine < ApplicationRecord
    belongs_to :workable, polymorphic: true, optional: true
    has_many :production_operations, as: :produceable, dependent: :destroy

    validates_presence_of :quantity
end
