class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :no
      t.string :name
      t.string :description
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.integer :project_team_id

      t.timestamps
    end
    add_index :projects, [:user_id, :project_team_id, :start_date, :end_date]
  end
end
