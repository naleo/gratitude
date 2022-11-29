FactoryBot.define do
    factory :user do |f|
        f.sequence(:name) { |n| "Test User#{n}" }
        f.sequence(:email) { |n| "test#{n}@account.com" }
        f.password { "password" }
        f.password_confirmation {|d| d.password}
    end
    factory :gratitude_item do |f|
        f.sequence(:name) { |n| "Gratitude Item #{n}" }
        f.date { Time.zone.now+1.day }
        f.association :user
    end
end