class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :description

      t.timestamps
    end
  end
end
