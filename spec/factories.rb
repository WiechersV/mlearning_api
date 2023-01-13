FactoryBot.define do
  factory :college

  factory :exam do
    college
  end

  factory :exam_window do
    exam
    start_time { DateTime.strptime("2023-01-13", "%Y-%m-%d")}
  end

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.cell_phone_with_country_code  }
    exam
  end

end