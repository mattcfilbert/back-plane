FactoryBot.define do
factory :work_order do
    work_order_number { Faker::Lorem.word }
    customer { Faker::Lorem.word }
    customer_order_number { Faker::Lorem.word }
    status { Faker::Lorem.word }
end
end