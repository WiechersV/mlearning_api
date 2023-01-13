class AddCollegeToExams < ActiveRecord::Migration[7.0]
  def change
    add_reference :exams, :college, null: false, foreign_key: true
  end
end
