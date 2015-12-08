FactoryGirl.define do
  factory :link, class: 'Link' do
    title "Testing Rails"
    url "http://testingrails.com"

    trait :invalid do
      title nil
      url "http://testing.com"
    end
  end
end
