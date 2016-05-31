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
def impressionist_attributes(overrider = {})
  {
    impressionable_type: "request", 
    impressionable_id: 1, 
    controller_name: "blog", 
    action_name: "show", 
    user_id: 1, 
    request_hash: "", 
    session_hash: "", 
    ip_address: "32.56.43.63", 
    referrer: ""
  }
end