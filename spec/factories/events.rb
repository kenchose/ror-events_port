FactoryBot.define do
  factory :event do
    name { "MyString" }
    date { "2018-10-10" }
    location { "MyString" }
    user { nil }
  end
end
