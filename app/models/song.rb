class Song < ActiveRecord::Base
  attr_accessible :titles, :titles_attributes, :versions_attributes

  has_many :titles, :dependent => :destroy
  has_many :versions, :dependent => :destroy

  accepts_nested_attributes_for :titles, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :versions

  validate :at_least_one_title
  validate :at_least_one_version
  validate :one_primary_title
  validate :only_one_primary_title

  after_initialize :set_defaults

  def set_defaults
    self.titles.build(:primary => true)  if self.titles.empty?
    self.versions.build if self.versions.empty?
  end

  def primary_title
    titles.first {|t| t.primary? } || titles.where(:primary => true).first
  end

  def save
    super
  rescue ActiveRecord::RecordNotUnique
    errors.add(:base, "title names needs to be unique")
    false
  end

  def at_least_one_title
  	errors.add(:base, "at least one title") if titles.empty?  	  	
  end

  def one_primary_title
    errors.add(:base, "please include one primary title") unless titles.any? {|title| title.primary? }
  end

  def only_one_primary_title
  	errors.add(:base, "please include only one primary title") if titles.select {|title| title.primary? }.size > 1  	
  end

  def at_least_one_version
  	errors.add(:base, "need at least one version") if versions.empty?
  end  

  private

  def only_one_title?
  	titles.size == 1
  end

end
