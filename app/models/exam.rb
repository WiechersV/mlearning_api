class Exam < ApplicationRecord
  belongs_to :college
  has_many :users
  has_one :exam_window
  
  validates :college, presence: true
end
