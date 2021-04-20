User.find_or_create_by!(username: "passwo") do |admin_user|
  admin_user.password = "password12"
end

AdminUser.find_or_create_by!(email: "admin@example.com") do |admin_user|
  admin_user.password = "password"
end
