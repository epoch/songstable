FactoryGirl.define do
  #sequence(:email) {|n| "person-#{n}@example.com" }
  #sequence(:count)

  factory :title do
    sequence(:name) {|n| "name-#{n}" }
  end

  factory :page do
  	page_number 1
  	asset_file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'qvb.jpg')) }
  end

  factory :version do  	
    pages do
    	Array.new(1) { FactoryGirl.build(:page) }
    end
  end

  factory :song do
    titles do
    	Array.new(1) { FactoryGirl.build(:title, :primary => true) }
    end

    versions do
    	Array.new(1) { FactoryGirl.build(:version) }
		end    	

    factory :song_with_2_title do
      titles do
        Array.new(2) { FactoryGirl.build(:title, :name => 'title', :primary => true) }
        #{ FactoryGirl.build(:title, :name => 'title', :primary => true) }
        #( FactoryGirl.build(:title, :name => 'title', :primary => false) }
      end 
    end
	end
 end