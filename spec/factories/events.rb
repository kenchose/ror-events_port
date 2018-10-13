FactoryBot.define do
  factory :event do
    name { "MyString" }
    date { "2018-10-10" }
    detail { "MyString" }
    city { "MyString" }
    state { "MyString" }
    user { nil }
  end
end
