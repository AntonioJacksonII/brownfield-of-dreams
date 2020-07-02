FactoryBot.define do
  factory :user do
    email  { Faker::Internet.email }
    first_name { Faker::Creature::Dog.name }
    last_name { Faker::Artist.name }
    password { Faker::Color.color_name }
    role { :default }
    github_token { "b9e026c06ba341648a7adc59612af8036f018542"}
  end

  factory :admin, parent: :user do
    role { :admin }
  end
end
