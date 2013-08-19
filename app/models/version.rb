class Version < ActiveRecord::Base
  attr_accessible :description, :pages, :pages_attributes

  belongs_to :song
  has_many :pages, :dependent => :destroy

  validate :have_at_least_one_page

  accepts_nested_attributes_for :pages, :reject_if => :all_blank, :allow_destroy => true

  def have_at_least_one_page
  	errors.add(:base, "please include at least one page of content") if pages.empty?
  end

end
