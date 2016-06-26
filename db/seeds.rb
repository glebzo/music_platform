100.times {Channel.create name: Faker::StarWars.planet, description: Faker::Lorem::sentence}
100.times {Soundtrack.create name: Faker::StarWars.character, channel: Channel.first }
