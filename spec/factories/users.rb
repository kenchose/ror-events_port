FactoryBot.define do
  factory :user do
    first_name { "Kenny" }
    last_name { "Pham" }
    email { "kenny@pham.com" }
    city { "Fullerton" }
    state { 'California' }
    password { "password" }
    password_confirmation { "password" }
  end
end
