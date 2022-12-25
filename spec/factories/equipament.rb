FactoryBot.define do
  factory :equipament do
    name { Faker::Commerce.product_name }
    kind { Random.rand(1..5) }
    brand { Faker::Company.name }
    picture {Rack::Test::UploadedFile.new(Rails.root.join("spec/support/images/a.png"))}
    place
  end
end