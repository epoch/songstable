class AddAssetFileAttributesToPage < ActiveRecord::Migration
  def change
    add_column :pages, :asset_file, :string  	
    add_column :pages, :asset_file_name, :string, :null => false
    add_column :pages, :asset_file_size, :integer
    add_column :pages, :asset_file_content_type, :string  	
  end
end
