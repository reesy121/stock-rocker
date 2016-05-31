#db/seeds.rb
case Rails.env
when 'development'
  # development-specific seeds ...
  # (anything you need to interactively play around with in the rails console)

when 'test'
  User.create!([
  {first_name: "Safe", last_name: "Admin", email: "testadmin@mvmanor.co.uk", password: "testadminuser", password_confirmation: "testadminuser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: true},
  {first_name: "Safe", last_name: "User 1", email: "testuser@mvmanor.co.uk", password: "testuseraccount", password_confirmation: "testuseraccount", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: false},
  {first_name: "Safe", last_name: "User 2", email: "testcustomer@customer.co.uk", password: "testcustomeruser", password_confirmation: "testcustomeruser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:44", last_sign_in_at: "2015-02-06 14:03:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: false}
])

when 'production'
  # production seeds (if any) ...

end

# common seeds ...
# (data your application needs in all environments)
categories = Category.create([{ name: "Rock 'n' Roll" }, { name: "Music" }, { name: "Life"},
								{ name: "Travel"}, { name: "Food"}])