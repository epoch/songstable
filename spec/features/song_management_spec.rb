require 'spec_helper'

feature "song management" do
  scenario "submitting a new song" do
    visit root_url
    click_link "Submit Song"

    fill_in "song_titles_attributes_0_name", with: "A whole new world"

		path = File.join(Rails.root, 'spec', 'support', 'qvb.jpg')
  	attach_file("song_versions_attributes_0_pages_attributes_0_asset_file", path)
    
    click_button "Submit Song"

    expect(page).to have_text("Song was successfully submitted.")
  end

  scenario "searching a song" do    
    song = FactoryGirl.build(:song)
    song.titles[0].name = 'a whole new world'
    song.save
    
  	visit root_url
  	fill_in "q", with: "world"
  	click_button "Search"

  	expect(page).to have_text("a whole new world")
  end

  scenario "selecting a song from search result" do
    song = FactoryGirl.build(:song)
    song.titles = []
    song.titles.new(:name => 'A whole new world', :primary => true)
    song.save

    visit root_url
    fill_in "q", with: "world"
    click_button "Search"

    expect(page).to have_text("A whole new world")

    click_link "A whole new world"
    expect(page).to have_text("A whole new world")        
  end

  context "admin" do
  	before do
  		song = FactoryGirl.create(:song)
  	end

  	scenario "listing songs" do
  		visit admin_songs_url
  		expect(page).to have_text("Total: 1")
  	end
  	
	end
end