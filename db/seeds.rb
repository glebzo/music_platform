100.times {Channel.create name: Faker::StarWars.planet, description: Faker::Lorem::sentence}
100.times {Soundtrack.create name: Faker::StarWars.character, channel: Channel.first }

Listener.create(email: 'admin@admin.com', password: '1234567', is_admin: true)