require 'spec_helper'

describe "Product pages" do
subject { page }
let(:user) { FactoryGirl.create(:user) }
before { sign_in user }
describe "product creation" do
before { visit root_path }
describe "with invalid information" do
it "should not create a product" do
expect { click_button "Post" }.should_not change(Product, :count)
end
describe "error messages" do
before { click_button "Post" }
it { should have_content('error') }
end
end
describe "with valid information" do
before { fill_in 'product_content', with: "Lorem ipsum" }
it "should create a product" do
expect { click_button "Post" }.should change(Product, :count).by(1)
end
end
end
end