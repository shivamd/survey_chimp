12.times do 
  Survey.create(:title => Faker::Lorem.sentence(num = rand(5) + 4),
                :description => Faker::Lorem.sentences,
                :user_id => rand(2) + 1)
end

60.times do
  Question.create(:content => Faker::Lorem.sentence(num = rand(5) + 4),
                  :survey_id => rand(12) + 1)
end