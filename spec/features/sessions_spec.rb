require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  context "root path" do
    before do
      visit root_path
    end

    context "when the user is not logged in" do
      it "shows a login link" do
        expect(page).to have_link("Login")
      end
    end

    context "when the user is logged in" do
      before do
        click_link "Login"
        fill_in "name", with: "jrock"
        click_link_or_button "login"
      end

      it "displays the expected text" do
        expect(page).to have_content("Hi, jrock")
      end

      it "has a logout link" do
        expect(page).to have_button("logout")
      end
    end
  end

  context "/login" do
    before do
      visit login_path
    end

    context "entering a name on the page" do
      it "refers to the user by that name" do
        fill_in "name", with: "foobedoobe"
        click_link_or_button "login"

        expect(page).to have_content("foobedoobe")
      end
    end

    context "entering a blank form" do
      it "returns the user to the login page" do
        click_link_or_button "login"

        expect(page).to have_content("Login")
      end
    end
  end
end


# a home page or root route. _ if the user is not logged in, the page should show them a login link. _ if the user is logged in, the page should say, "hi, #{name}", and provide a logout link.
# a login page _ users can enter their name in a form and click 'login'. Thereafter, the app will refer to them by that name. _ if the user does not enter a name, they are not logged in. Return them to the login page.