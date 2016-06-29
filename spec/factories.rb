FactoryGirl.define {
  factory :channel do
    name Faker::StarWars.planet
    description Faker::Lorem.sentence
  end

  factory :listener do
    email "demo@example.com"
    password 'password'
  end
}