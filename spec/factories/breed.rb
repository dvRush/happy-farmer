FactoryBot.define do
  factory :breed do
    sequence(:name) { |i| "Breed #{i}" }

    #trait :cow do
    #  animal_type { :cow }
    #end
  end
end
