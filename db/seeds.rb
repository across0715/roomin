User.create!(password: "password") unless User.exists?

AdminUser.find_or_create_by!(email: "admin@example.com") do |admin_user|
  admin_user.password = "password"
end
