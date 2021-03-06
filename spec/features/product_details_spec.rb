require 'rails_helper'

RSpec.feature "Visitor navigates to a product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    # 1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    # end
  end

  scenario "They see products details" do
    visit root_path
    click_link("Details")
    # visit products#show


    # commented out b/c it's for debugging only

    expect(page).to have_css 'section.products-show'
    save_screenshot
  end

end




