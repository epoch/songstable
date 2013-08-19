class Title < ActiveRecord::Base
	include PgSearch
  pg_search_scope :search_by_name, 
  	:against => :name, 
  	:using => {
    	:tsearch => { :prefix => true }
    }

  attr_accessible :name, :song_id, :primary

  belongs_to :song

  validates :name, :presence => true
end
