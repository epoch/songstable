require 'spec_helper'

describe Page do
	let(:song) { song = FactoryGirl.build(:song) }

  it "should raise exception when asset_file_name is missing" do
  	page = Page.new
  	expect{ page.save! }.to raise_exception(/Asset file name/)	
  end

  it "should have an asset_file_name" do
  	expect { song.save }.to change { song.versions.first.pages.first.asset_file_name }.to('qvb.jpg')
  end

  it "should raise exception when page number not unique" do
  	page1 = FactoryGirl.build(:page)
  	page2 = FactoryGirl.build(:page)
  	song.versions.first.pages = [page1, page2]
    expect{ song.save! }.to raise_exception(/unique constraint/)	
	end
end
