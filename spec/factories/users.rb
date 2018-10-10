FactoryBot.define do
  factory :user do
    first_name { "Kenny" }
    last_name { "Pham" }
    email { "kenny@pham.com" }
    location { "Alhambra, CA" }
    password { "password" }
    password_confirmation { "password" }
  end
end
