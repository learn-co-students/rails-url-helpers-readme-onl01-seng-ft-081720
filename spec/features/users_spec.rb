require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(name: "Amy Newland", description: "My post desc")
  end

  it 'shows the name on the show page in a h1 tag' do
    visit "/users/#{@user.id}"
    expect(page).to have_css("h1", text: "Amy Newland")
  end

  it 'shows the description on the show page in a p tag' do
    visit "/users/#{@user.id}"
    expect(page).to have_css("p", text: "My post desc")
  end
end

describe 'index page' do
  it 'links to post page' do
    first_user = User.create(name: "New Name", description: "New description")
    visit users_path
    expect(page).to have_link(first_user.name, href: user_path(first_user))
  end
end

