Upload.destroy_all
Game.destroy_all
Player.destroy_all
User.destroy_all

Game.skip_callback(:create, :after, :create_initial_host)

# Game 1
user1 = User.create(email: 'kathleen.csizmadia@gmail.com', password: '12345678', name: 'Kathleen Csizmadia')
date1 = DateTime.new(2015, 03, 22)
game1 = Game.create(honoree_name: 'Kathleen Votolato', event_date: date1, require_password: true, password: 'jose')
player1 = Player.create(game: game1, role: 'host', user: user1, is_creator: true)
upload1 = Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', user: user1, player_id: player1.id)

# Game 2
user2 = User.create(email: 'bff@example.com', password: '12345678', name: 'Best Friend')
date2 = DateTime.new(2016, 8, 19)
game2 = Game.create(honoree_name: 'Cracker Jane', event_date: date2, require_password: true, password: 'hello')
player2 = Player.create(game: game2, role: 'host', user: user2, is_creator: true)
upload2 = Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', user: user2, player_id: player2.id)

# Game 3
user3 = User.create(email: 'mom@example.com', password: '12345678', name: 'Mom')
date3 = DateTime.new(2016, 9, 30)
game3 = Game.create(honoree_name: 'Miss Preggers', event_date: date3, require_password: true, password: 'hello')
player3 = Player.create(game: game3, role: 'host', user: user3, is_creator: true)
upload3 = Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', user: user3, player_id: player3.id)

# Host from game 1 will be a player on games 2 and 3
player = Player.create(game: game2, user: user1, role: 'player', upload: upload1)
player = Player.create(game: game3, user: user1, role: 'player', upload: upload1)

Game.set_callback(:create, :after, :create_initial_host)

# Create additional users, players, and uploads for game 1
jie = User.create(name: 'Jie Chen', email: 'jie@example.com', is_guest: true, guest_key: '1234', password: '12345678')
diane = User.create(name: 'Diane Blair', email: 'diane@example.com', is_guest: true, guest_key: '1234', password: '12345678')
regina = User.create(name: 'Regina Costa', email: 'regina@example.com', is_guest: true, guest_key: '1234', password: '12345678')
eva = User.create(name: 'Eva Csizmadia', email: 'eva@example.com', is_guest: true, guest_key: '1234', password: '12345678')
karen = User.create(name: 'Karen Kline', email: 'karen@example.com', is_guest: true, guest_key: '1234', password: '12345678')
bonnie = User.create(name: 'Bonnie Alexander', email: 'bonnie@example.com', is_guest: true, guest_key: '1234', password: '12345678')
kelly = User.create(name: 'Kelly Votolato', email: 'kelly@example.com', is_guest: true, guest_key: '1234', password: '12345678')
rita = User.create(name: 'Rita Csizmadia', email: 'rita@example.com', is_guest: true, guest_key: '1234', password: '12345678')
brenda = User.create(name: 'Brenda Hartman', email: 'brenda@example.com', is_guest: true, guest_key: '1234', password: '12345678')
blair = User.create(name: 'Blair Hall', email: 'blair@example.com', is_guest: true, guest_key: '1234', password: '12345678')
lina = User.create(name: 'Lina Keo', email: 'lina@example.com', is_guest: true, guest_key: '1234', password: '12345678')
catherine = User.create(name: 'Catherine Votolato', email: 'catherine@example.com', is_guest: true, guest_key: '1234', password: '12345678')
martha = User.create(name: 'Martha Pearson', email: 'martha@example.com', is_guest: true, guest_key: '1234', password: '12345678')
sally = User.create(name: 'Sally Koss', email: 'sally@example.com', is_guest: true, guest_key: '1234', password: '12345678')
cyndi = User.create(name: 'Cyndi Koss', email: 'cyndi@example.com', is_guest: true, guest_key: '1234', password: '12345678')
leona = User.create(name: 'Leona Worsley', email: 'leona@example.com', is_guest: true, guest_key: '1234', password: '12345678')

p_jie = Player.create(game: game1, user: jie, role: 'player')
p_diane = Player.create(game: game1, user: diane, role: 'player')
p_regina = Player.create(game: game1, user: regina, role: 'player')
p_eva = Player.create(game: game1, user: eva, role: 'player')
p_karen = Player.create(game: game1, user: karen, role: 'player')
p_bonnie = Player.create(game: game1, user: bonnie, role: 'player')
p_kelly = Player.create(game: game1, user: kelly, role: 'player')
p_rita = Player.create(game: game1, user: rita, role: 'player')
p_brenda = Player.create(game: game1, user: brenda, role: 'player')
p_blair = Player.create(game: game1, user: blair, role: 'player')
p_lina = Player.create(game: game1, user: lina, role: 'player')
p_catherine = Player.create(game: game1, user: catherine, role: 'player')
p_martha = Player.create(game: game1, user: martha, role: 'player')
p_sally = Player.create(game: game1, user: sally, role: 'player')
p_cyndi = Player.create(game: game1, user: brenda, role: 'player')
p_leona = Player.create(game: game1, user: leona, role: 'player')

Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Jie+Chen.jpg', user: jie, player_id: p_jie.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Diane+Blair+1.jpg', user: diane, player_id: p_diane.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Regina+Costa.jpg', user: regina, player_id: p_regina.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Eva+Csizmadia.jpg', user: eva, player_id: p_eva.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Karen+Kline.jpg', user: karen, player_id: p_karen.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Bonnie+Alexander.jpg', user: bonnie, player_id: p_bonnie.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kelly+Votolato.jpg', user: kelly, player_id: p_kelly.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Rita+Csizmadia.jpg', user: rita, player_id: p_rita.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Brenda+Hartman.jpg', user: brenda, player_id: p_brenda.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Blair+Hall+2.jpg', user: blair, player_id: p_blair.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Lina+Keo.jpg', user: lina, player_id: p_lina.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Catherine+Votolato.jpg', user: catherine, player_id: p_catherine.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Martha+Pearson.jpg', user: martha, player_id: p_martha.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Sally+Koss.jpg', user: sally, player_id: p_sally.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Cyndi+Koss.jpg', user: cyndi, player_id: p_cyndi.id)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Leona+Worsley.jpg', user: leona, player_id: p_leona.id)
