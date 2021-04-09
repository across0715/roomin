User.create!(
  name: "user",
  room_number: "1111",
  password: "password",
)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?