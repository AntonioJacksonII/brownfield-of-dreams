FactoryBot.define do
  factory :user do
    email  { Faker::Internet.email }
    first_name { Faker::Creature::Dog.name }
    last_name { Faker::Artist.name }
    password { Faker::Color.color_name }
    role { :default }
    github_token { "65c3120320a4b57e90fe580b0222f28db498f640"}
  end

  factory :admin, parent: :user do
    role { :admin }
  end
end
