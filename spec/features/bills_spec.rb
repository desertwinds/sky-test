require 'rails_helper'
RSpec.feature "Bills spec", :js, driver: :selenium do

  describe "bill page" do

    context "correct request to server " do
      before do
        stub_request(:get, "http://safe-plains-5453.herokuapp.com/bill.json").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => bill_stub.to_json, :headers => {'content-type': 'application/json'})

        visit root_path
        wait_for_ajax
      end

      it "loads correctly the page" do

        #The default statement tab
        expect(page).to have_text 'Your Sky Bill'
        expect(page).to have_text 'Total amount: 136.03'
        expect(page).to have_text 'Date 11 January 2015'

        #The packages tab
        click_link('packages')
        expect(page).to have_text 'Variety with Movies HD'

        #The packages tab
        click_link('calls')
        expect(page).to have_text '07716393769'

        click_link('Next')
        expect(page).to have_text '02074351359'

        #The packages tab
        click_link('store')
        expect(page).to have_text '50 Shades of Grey'

        click_link('Buy & Keep')
        expect(page).to have_text 'Broke back mountain'
      end
    end


    context "incorrect request to server " do
      before do
        stub_request(:get, "http://safe-plains-5453.herokuapp.com/bill.json").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 400, :body => "", :headers => {})
        visit root_path
        wait_for_ajax
      end

      it "loads an error on the page" do

        expect(page).to have_text 'Error on the API endpoint.'
        expect(page).to have_no_text 'Total amount: 136.03'

      end
    end

    
  end
end