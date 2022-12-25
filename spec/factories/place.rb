FactoryBot.define do
  factory :place do
    name { Faker::Fantasy::Tolkien.location }
  end
end
