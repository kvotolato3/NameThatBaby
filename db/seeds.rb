kathleen = User.create(email: 'kathleen.csizmadia@gmail.com', password: '12345678')

date = DateTime.new(2015, 03, 22)
game = Game.create(honoree_name: 'Kathleen Votolato', event_date: date, require_password: true, password: 'jose')

Player.create([{name: 'Jie Chen', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Jie+Chen.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Diane Blair', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Diane+Blair+1.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Regina Costa', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Regina+Costa.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Eva Csizmadia', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Eva+Csizmadia.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Karen Kline', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Karen+Kline.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Bonnie Alexander', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Bonnie+Alexander.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Kelly Votolato', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kelly+Votolato.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Kathleen Votolato', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', email: 'kathleen.csizmadia@gmail.com', game: game, is_host: true, user: kathleen},
      {name: 'Rita Csizmadia', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Rita+Csizmadia.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Brenda Hartman', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Brenda+Hartman.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Blair Hall', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Blair+Hall+2.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Lina Keo', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Lina+Keo.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Catherine Votolato', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Catherine+Votolato.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Martha Pearson', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Martha+Pearson.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Mira Nakhle', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Mira+Nakhle.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Sally Koss', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Sally+Koss.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Cyndi Koss', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Cyndi+Koss.jpg', email: 'kathleen.csizmadia@gmail.com', game: game},
      {name: 'Leona Worsley', aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Leona+Worsley.jpg', email: 'kathleen.csizmadia@gmail.com', game: game}])
