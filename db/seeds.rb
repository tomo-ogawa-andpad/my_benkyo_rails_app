User.create!(
  name: 'admin',
  email: 'admin@example.com',
  admin: true,
  password: 'password123',
  password_confirmation: 'password123'
)
User.create!(
  name: 'hoge',
  email: 'hoge@example.com',
  admin: false,
  password: 'password123',
  password_confirmation: 'password123'
)

user = User.find_by(name: 'hoge')
user.posts.create!(
  title: '最初の投稿',
  body: '最初の投稿だよ～'
)
