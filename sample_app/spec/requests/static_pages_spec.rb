require 'spec_helper'

describe "Static pages" do

  #let(:base_title) { "CS 232 Rails Development" }

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Microblog') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
    
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem")
        FactoryGirl.create(:micropost, user: user, content: "Ipsum")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end
  
  describe "Contact page" do
    before { visit contact_path }
    
    it { should have_content('Contact') }

    # 1. The page title should be: CS 232 Rails Development | Contact
    it { should have_title(full_title('Contact')) }
    
    # 2. The page should contain the words 'CS 232 Contact'.
    it { should  have_content('CS 232 Contact') }
    
    # 3. The page should contain an <h1 class="page-title"> element.
    it { should have_xpath('//h1[@class="page-title"]') }
    
    # 4. The page should contain a Definition List with a <dl>
    it { should have_xpath('//dl') }
    
    # 5. The page should contain an HTML element <dt> element.
    it { should have_xpath('//dt') }
    
    # 6. The page should contain an HTML element <dd> element.
    it { should have_xpath('//dd') }
    
    # 7. The page should contain an HTML element named <section class="main">
    it { should have_xpath('//section[@class="main"]') }
    
    # 8. The CSS should contain an h1.page-title selector.
    it { should have_css('h1.page-title') }
    
    # 9. The CSS should contain a .main selector.
    it { should have_css('.main') }
  end
end
