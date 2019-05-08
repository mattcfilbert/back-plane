FactoryBot.define do 
factory :work_order_line do
    quantity { Faker::Number.number(10) }
    released false
    complete false
    workable_id nil
    workable_type nil
 end
end