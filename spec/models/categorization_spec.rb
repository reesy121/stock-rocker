require 'rails_helper'

RSpec.describe Categorization, type: :model do

  #it "category link must be present"

  #it "blog link must be present"

  it "blog and category must be unique" do
  	Categorization.create(categorization_attributes)

  	@categorization = Categorization.new(categorization_attributes)

  	@categorization.valid?

  	expect(@categorization.errors.any?).to eq(true)
  end

  it "can accept nested attributes for category" #Do we really need this if this is already tested through blog?
end
