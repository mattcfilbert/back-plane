class Part < ApplicationRecord
    has_many :work_order_lines, as: :workable, dependent: :destroy
    has_many :part_operations, dependent: :destroy

    validates_presence_of :number, :name
end
