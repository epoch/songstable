require 'spec_helper'

describe Title do
	it "is searchable by name" do
		song = FactoryGirl.build(:song)
		title = Title.new(:name => 'A whole new world')
		song.titles << title
		song.save
		titles = Title.search_by_name('world')
		titles.should include(title)
	end

	it "has a name" do
		song = FactoryGirl.build(:song)
		song.titles = []
		song.titles.new(:primary => true)
		expect{song.save!}.to raise_exception(/name can't be blank/)
	end

end
