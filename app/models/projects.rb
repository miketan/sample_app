class Projects < ActiveRecord::Base
  attr_accessible :description, :end_date, :name, :no, :project_team_id, :start_date, :user_id
end
