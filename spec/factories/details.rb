FactoryBot.define do
  factory :detail do
    age {"20"}
    area_id {"2"}
    occupation_id {"2"}
    genre_id {"2"}
    school {"〇〇大学"}
    experience_id {"2"}
    language_id {"2"}
    interest_id {"2"}
    pr {"こんにちは！"}
    association :user
  end
end
