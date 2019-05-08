FactoryBot.define do 
    factory :part do
        name { Faker::Lorem.word }
        number { Faker::Lorem.word }
     end
    end