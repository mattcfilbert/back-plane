class WorkOrder < ApplicationRecord
    has_many :work_order_lines, as: :workable, dependent: :destroy
    validates_presence_of :work_order_number, :customer, :customer_order_number, :status
end
