# Create games
date1 = DateTime.new(2015, 03, 22)
game1 = Game.create(honoree_name: 'Kathleen Votolato', event_date: date1, require_password: true, password: 'jose')

honoree_name2 = Faker::Name.name
date2 = DateTime.new(2016, 02, 14)
game2 = Game.create(honoree_name: honoree_name2, event_date: date2, require_password: true, password: 'hello')

honoree_name3 = Faker::Name.name
date3 = DateTime.new(2016, 02, 21)
game3 = Game.create(honoree_name: honoree_name3, event_date: date3, require_password: true, password: 'hello')

# Create hosts
kathleen = User.create(email: 'kathleen.csizmadia@gmail.com', password: '12345678', name: 'Kathleen Csizmadia')
p_kathleen = Player.create(name: 'Kathleen Csizmadia', email: 'kathleen.csizmadia@gmail.com', game: game1, is_host: true, user: kathleen)
Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', player: p_kathleen}])

first_name2 = Faker::Name.first_name
last_name2 = Faker::Name.last_name
email2 = first_name2 + '@example.com'
host2 = User.create(email: email2, password: '12345678', name: first_name2 + ' ' + last_name2)
p_2 = Player.create(name: first_name2 + ' ' + last_name2, email: email2, game: game2, is_host: true, user: host2)
Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', player: p_2}])

first_name3 = Faker::Name.first_name
last_name3 = Faker::Name.last_name
email3 = first_name3 + '@example.com'
host3 = User.create(email: email3, password: '12345678', name: first_name3 + ' ' + last_name3)
p_3 = Player.create(name: first_name3 + ' ' + last_name3, email: email3, game: game3, is_host: true, user: host3)
Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', player: p_3}])

# Create players for game 1
15.times do |i|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = first_name + '@example.com'
      player = Player.create(name: first_name + ' ' + last_name, email: email, game: game1)
      Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Leona+Worsley.jpg', player: player}])
end

# Create players for game 2
14.times do |i|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = first_name + '@example.com'
      player = Player.create(name: first_name + ' ' + last_name, email: email, game: game2)
      Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Leona+Worsley.jpg', player: player}])
end

# Create players for game 3
14.times do |i|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = first_name + '@example.com'
      player = Player.create(name: first_name + ' ' + last_name, email: email, game: game3)
      Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Leona+Worsley.jpg', player: player}])
end

# Host from game 1 will be a player on games 2 and 3
player = Player.create(name: 'Kathleen Csizmadia', email: 'kathleen.csizmadia@gmail.com', game: game2, user: kathleen)
Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', player: player}])

player = Player.create(name: 'Kathleen Csizmadia', email: 'kathleen.csizmadia@gmail.com', game: game3, user: kathleen)
Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', player: player}])


#Original game players
      # {name: 'Diane Blair', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Diane+Blair+1.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Regina Costa', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Regina+Costa.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Eva Csizmadia', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Eva+Csizmadia.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Karen Kline', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Karen+Kline.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Bonnie Alexander', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Bonnie+Alexander.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Kelly Votolato', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kelly+Votolato.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Rita Csizmadia', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Rita+Csizmadia.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Brenda Hartman', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Brenda+Hartman.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Blair Hall', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Blair+Hall+2.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Lina Keo', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Lina+Keo.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Catherine Votolato', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Catherine+Votolato.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Martha Pearson', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Martha+Pearson.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Mira Nakhle', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Mira+Nakhle.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Sally Koss', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Sally+Koss.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Cyndi Koss', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Cyndi+Koss.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      # {name: 'Leona Worsley', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Leona+Worsley.jpg', email: 'kathleen.csizmadia@gmail.com', game: game}])
