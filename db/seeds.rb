50.times {Channel.create name: Faker::StarWars.planet, description: Faker::Lorem::sentence, image: File.new(("#{Rails.root}/spec/support/fixtures/cover256x256.jpg"))}
100.times {Soundtrack.create name: Faker::StarWars.character, channel: Channel.first }

Listener.create(email: 'admin@admin.com', password: '1234567', is_admin: true)