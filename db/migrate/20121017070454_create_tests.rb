class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :teststring
      t.integer :testinteger

      t.timestamps
    end
  end
end
