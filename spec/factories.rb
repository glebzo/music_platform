FactoryGirl.define {
  factory :channel do
    name Faker::StarWars.planet
    description Faker::Lorem.sentence
    image { File.new("#{Rails.root}/spec/support/fixtures/cover256x256.jpg") }
  end

  factory :listener do
    email "demo@example.com"
    password 'password'
    is_admin false
  end
}