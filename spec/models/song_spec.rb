require 'spec_helper'

describe Song do

	it { should have_many :titles }
	it { should have_many :versions }
	it { should have(1).titles }
	it { should have(1).versions }

	describe "titles" do

		context "with no title" do
			let(:song) do
				song = Song.new
				song.titles = []
				song 
			end

			it "raise exception with error message at least one title" do
				expect { song.save! }.to raise_exception(/at least one title/)
			end
		end

	  context "with one title" do
	  	let(:title) { Title.new(:name => 'first title', :primary => true) }
	  	let(:song) do
	  		song = Song.new
	  		song.titles[0] = title
	  		song
	  	end
	  	subject { song }

			it { should have(1).titles }
	  	its(:titles) { should include(title) }
	  	its('titles.first') { should be_primary }

	  	describe "#primary_title" do
	  		it "returns the primary title" do
	  			song.primary_title.should == title
	  		end
	  	end

			context "when primary is set to false" do
				let(:song) do
					song = Song.new
					song.titles[0].name = 'first title'
					song.titles[0].primary = false
					song
				end

				it "raise exception with error message last title must be primary" do
					expect{song.save!}.to raise_exception(/last title must be primary/)
				end
			end
	  end

	  context "with 2 titles" do
	  	let(:title1) { Title.new(:name => 'first title', :primary => true) }
	  	let(:title2) { Title.new(:name => 'second title', :primary => false) }
	  	let(:song) do
	  		song = Song.new
	  		song.titles = title1, title2
	  		song
	  	end
	  	subject { song }

			context "when valid" do
			 	it "does not raise title related exception" do
		  		expect{song.save!}.not_to raise_exception(/title/)
		  	end	  	
			end

			context "when both title names are identical" do
		  	it "errors includes 'titles need to be unique'" do
		  		song = FactoryGirl.build(:song_with_2_title)
		  		song.titles[1].primary = false
		  		song.save
		  		song.errors.messages[:base].should include("title names needs to be unique")
		  	end
			end

			context "when both are set as primary" do			
		  	it "raise exception with error message only one primary" do
		  		song.titles[1].primary = true
		  		expect{song.save!}.to raise_exception(/only one primary/)
		  	end
			end
	  end
	end

  describe "versions" do
		let(:song) do
			song = FactoryGirl.build(:song_with_2_title)
			
		end

		context "when empty" do			
			it "raise exception with error need at least one version" do
				song.versions = []
				expect{song.save!}.to raise_exception(/need at least one version/)
			end
		end  

	end

end


