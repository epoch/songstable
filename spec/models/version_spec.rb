require 'spec_helper'

describe Version do
  
  context "pages" do
		let(:version) do
			version = Version.new
		end

  	context "empty" do
  		it "error msg should include 'please include at least one page'" do
  			expect{version.save!}.to raise_exception(/please include at least one page/)  			
  		end
  	end

  	context "has one page" do
  		before do
  			version.pages << Page.new
  		end

  		it "wont include error 'please include at least one page'" do
  			expect{version.save!}.not_to raise_exception(/please include at least one page/)  			
  		end
  	end

  	context "has two pages" do
  		let(:song) { FactoryGirl.build(:song) }

  		it "cannot have two pages with the same page number" do
  			version = FactoryGirl.build(:version)
  			version.song = song
  			version.pages << FactoryGirl.build(:page)
  			version.pages << FactoryGirl.build(:page)
  			version.should have_at_least(2).pages
  			expect{version.save!}.to raise_exception(/unique constraint/)  			
  		end

  		it "cannot have two pages with the same page number" do
  		  version = song.versions.first
  			version.pages << FactoryGirl.build(:page, :page_number => 3)
  			version.pages << FactoryGirl.build(:page, :page_number => 3)
  			version.should have_at_least(2).pages

  			expect{song.save!}.to raise_exception(/unique constraint/)
  			#song.save!
  			#$stdout.puts song.errors.to_s
  			

  		end

  	end
  end
end
