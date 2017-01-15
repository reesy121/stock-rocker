#db/seeds.rb
case Rails.env
when 'development'
  # development-specific seeds ...
  # (anything you need to interactively play around with in the rails console)
when 'test'
	
when 'production'
  # production seeds (if any) ...

end
categories = Category.create!([{ name: "Rock 'n' Roll" }, { name: "Music" }, { name: "Life"},
								{ name: "Travel"}, { name: "Food"}])