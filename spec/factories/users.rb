FactoryGirl.define do
  factory :user do
    first_name "Cutty"
    last_name  "McMeat"
    email      "meatisawesome@hotmail.com"

    factory :user_with_favorite do
      after :create do |user|
        create(:favorite, user: user, cut: cut)
      end
    end

  end

  factory :favorite do
    cut :cut
  end

end
