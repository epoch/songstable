class Page < ActiveRecord::Base
  attr_accessible :asset_file, :asset_file_cache, :asset_file_size, :asset_file_name, :asset_file_content_type, :page_number, :version_id

  belongs_to :version

  mount_uploader :asset_file, AssetUploader  

  validates :asset_file_name, :presence => true
  #validates :page_number, :uniqueness => { :scope => :version_id }

  before_validation :update_asset_attributes  

  private

  def update_asset_attributes
    if asset_file.present? && asset_file_changed?
      self.asset_file_content_type = asset_file.file.content_type unless asset_file.file.content_type.blank?
      self.asset_file_size = asset_file.file.size
      self.asset_file_name = asset_file.file.filename
    end
  end 

end
