require 'spec_helper'

feature 'Homepage' do
  scenario 'Has welcome and messages can be added' do
    visit '/'

    expect(page).to have_content 'Welcome!'

    fill_in('name', :with => 'natalie')

    fill_in('message', :with => 'message')

    click_button('add message')

    expect(page).to have_content ('message') + ('name')

  end
end


#As a visitor
#   When I go to the home page
#   I see
#   * a name text field
#   * a message text field
#   * a submit button that says "Add Message"
#
#   When I click the button,
#   I see my message appear beneath the message
#box.  It shows my message and my name.
