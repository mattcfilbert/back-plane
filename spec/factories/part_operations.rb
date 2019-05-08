FactoryBot.define do 
    factory :part_operation do
        name { Faker::Lorem.word }
        number { Faker::Lorem.word }
        part_id nil
        
     end
    end