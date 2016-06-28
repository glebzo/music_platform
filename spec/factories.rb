FactoryGirl.define {
  factory :channel do
    name Faker::StarWars.planet
    description Faker::Lorem.sentence
  end
}