def blog_attributes(overrides = {})
  {
    title: "Brian or Bust?", 
    sub_title: "Money Talks", 
    categorizations_attributes: {"0"=>{"category_id"=>"1", "_destroy"=>"false"} }, 
    user_id: 1,
    tags: "AC/DC Gibson SG Angus Young", 
    posts_attributes: {"0"=>{"content"=>"a" * 250, "_destroy"=>"false" } }
  }.merge(overrides)
end
#
def blog_6_post_attributes(overrides = {})
  {
    title: "Brian or Bust?", 
    sub_title: "Money Talks", 
    categorizations_attributes: {"0"=>{"category_id"=>"1", "_destroy"=>"false"} }, 
    user_id: 1,
    tags: "AC/DC Gibson SG Angus Young", 
    posts_attributes: {"0"=>{"content"=>"a" * 250, "_destroy"=>"false" },
                        "1"=>{"content"=>"a" * 250, "_destroy"=>"false" },
                        "2"=>{"content"=>"a" * 250, "_destroy"=>"false" },
                        "3"=>{"content"=>"a" * 250, "_destroy"=>"false" },
                        "4"=>{"content"=>"a" * 250, "_destroy"=>"false" },
                        "5"=>{"content"=>"a" * 250, "_destroy"=>"false" } 
                       }
  }.merge(overrides)
end
#
def comment_attributes(overrides = {})
  {
    content: "a" * 100, 
    user_id: 1
  }.merge(overrides)
end
#
def impressionist_attributes(overrides = {})
  {
    impressionable_type: "Blog", 
    impressionable_id: 1, 
    controller_name: "blogs", 
    action_name: "show", 
    user_id: "", 
    request_hash: "a1bf7299b3bfbc4d32838167864207d0332a7b8c622e868684...", 
    session_hash: "774accc9afee5b77301c87d5aabb2174", 
    ip_address: "32.56.43.63", 
    referrer: ""
  }.merge(overrides)
end
#
def user_attributes(overrides = {})
  {
    first_name: "Test", 
    last_name: "Rspec", 
    email: "testtest@rspec.com", 
    password: "testing123", 
    password_confirmation: "testing123", 
    reset_password_token: nil, 
    reset_password_sent_at: nil, 
    remember_created_at: nil, 
    sign_in_count: 0, 
    current_sign_in_at: "2015-02-06 14:02:10", 
    last_sign_in_at: "2015-02-06 14:02:10", 
    current_sign_in_ip: "127.0.0.1", 
    last_sign_in_ip: "127.0.0.1"
  }.merge(overrides)
end
#
def categorization_attributes(overrides = {})
  {
    category_id: 1,
    blog_id: 1
    }.merge(overrides)
end
def category_attributes(overrides= {})
  {
    name: "Action"
  }
  
end
#
def contact_attributes(overrides = {})
  {
    name: "David Testy Test",
    message: "a" * 200,
    email: "admin@reesy121.co.uk"
    }.merge(overrides)
end
#
def song_attributes(overrides = {}, file="#{Rails.root}/spec/support/fixtures/2mb.mp3")
  audio = File.new(file)
  {
    title: "Silver Tongue", 
    artist: "X-32", 
    audio:  audio
  }.merge(overrides)
end