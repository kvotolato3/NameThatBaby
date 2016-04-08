Upload.destroy_all
Game.destroy_all
Player.destroy_all
User.destroy_all

# Create games
date1 = DateTime.new(2015, 03, 22)
game1 = Game.create(honoree_name: 'Kathleen Votolato', event_date: date1, require_password: true, password: 'jose')

date2 = DateTime.new(2016, 8, 19)
game2 = Game.create(honoree_name: 'Cracker Jane', event_date: date2, require_password: true, password: 'hello')

date3 = DateTime.new(2016, 9, 30)
game3 = Game.create(honoree_name: 'Miss Preggers', event_date: date3, require_password: true, password: 'hello')

# Create hosts
user1 = User.create(email: 'kathleen.csizmadia@gmail.com', password: '12345678', name: 'Kathleen Csizmadia')
player1 = Player.create(game: game1, role: 'host', user: user1, is_creator: true)
Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', player: player1}])

user2 = User.create(email: 'bff@example.com', password: '12345678', name: 'Best Friend')
player2 = Player.create(game: game2, role: 'host', user: user2, is_creator: true)
Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', player: player2}])

user3 = User.create(email: 'mom@example.com', password: '12345678', name: 'Mom')
player3 = Player.create(game: game3, role: 'host', user: user3, is_creator: true)
Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', player: player3}])

# Host from game 1 will be a player on games 2 and 3
player = Player.create(game: game2, user: user1, role: 'player')
Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', player: player}])

player = Player.create(game: game3, user: user1)
Upload.create([{aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kathleen+Votolato.jpg', player: player}])

# Create users, players, and uploads for game 1
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


Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Jie+Chen.jpg', player: p_jie)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Diane+Blair+1.jpg', player: p_diane)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Regina+Costa.jpg', player: p_regina)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Eva+Csizmadia.jpg', player: p_eva)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Karen+Kline.jpg', player: p_karen)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Bonnie+Alexander.jpg', player: p_bonnie)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Kelly+Votolato.jpg', player: p_kelly)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Rita+Csizmadia.jpg', player: p_rita)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Brenda+Hartman.jpg', player: p_brenda)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Blair+Hall+2.jpg', player: p_blair)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Lina+Keo.jpg', player: p_lina)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Catherine+Votolato.jpg', player: p_catherine)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Martha+Pearson.jpg', player: p_martha)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Sally+Koss.jpg', player: p_sally)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Cyndi+Koss.jpg', player: p_cyndi)
Upload.create(aws_s3_bucket: 'kathleen-namethatbaby', aws_s3_key: 'photos/Leona+Worsley.jpg', player: p_leona)
