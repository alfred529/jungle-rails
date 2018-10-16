require 'rails_helper'

RSpec.feature "Visitor navigates to My Cart page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see products details" do
    visit root_path
    save_screenshot # should save with '0' in cart

    click_on("Add")
    # visit products#show


    # commented out b/c it's for debugging only

    expect(page).to have_text 'My Cart (1)'
    save_screenshot # should save with '1' in cart
  end

end

