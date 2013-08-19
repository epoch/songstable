class AddPageNumberToPages < ActiveRecord::Migration
  def change
    add_column :pages, :page_number, :integer
    add_index :pages, [:version_id, :page_number], :unique => true
  end
  
end
