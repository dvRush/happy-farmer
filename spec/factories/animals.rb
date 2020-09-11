FactoryBot.define do
  factory :cow do
    sequence(:tag) { |i| "Tag ##{i}" }
    birth_date { Date.new(2019, 1, 1) }
    genre { :female }
    association :breed, :cow
  end
end
