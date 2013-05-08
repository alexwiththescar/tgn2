require 'spec_helper'

describe "Static pages" do

describe "Home page" do

  it "should have the h1 'The Growers Network'" do
    visit '/'
    page.should have_selector('h1', :text => 'The Growers Network')
end

it "should have the the base title" do
  visit '/'
  page.should have_selector('title', :text => "The Growers Network")
end

it "should not have a custom page title" do
  visit '/'
  page.should_not have_selector('title', :text => '| Home')
end

end
describe "Help page" do
it "should have the h1 'Help'" do
visit '/help'
page.should have_selector('h1', :text => 'Help')
end
it "should have the title 'Help'" do
visit '/help'
page.should have_selector('title',
:text => "The Growers Network | Help")
end

end
describe "About page" do
it "should have the h1 'About Us'" do
visit '/about'
page.should have_selector('h1', :text => 'About Us')
end
it "should have the title 'About Us'" do
visit '/about'
page.should have_selector('title',
:text => "The Growers Network | About Us")
end


describe "Contact page" do
it "should have the h1 'Contact'" do
visit '/contact'
page.should have_selector('h1', text: 'Contact')
end

it "should have the title 'Contact'" do
visit '/contact'
page.should have_selector('title', text: "The Growers Network | Contact")
end
end

end



end