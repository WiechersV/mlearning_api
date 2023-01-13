class User < ApplicationRecord
  belongs_to :exam
  has_one :college, through: :exam, required: true
  
  validates :first_name, :last_name, :phone_number, :exam, presence: true
  validates :phone_number, phone: {
      countries: [:us, :br],
      message: -> (object, data) do
        "Invalid format for number #{object.phone_number}"
      end
    }
end
