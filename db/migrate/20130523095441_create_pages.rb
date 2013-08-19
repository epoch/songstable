class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|

    	t.integer :version_id, :null => false
      t.timestamps
    end
  end
end
