22.times do 
  Survey.create(:name => Faker::Lorem.sentence(num = rand(5) + 4),
                :description => Faker::Lorem.sentences,
                :user_id => rand(2) + 1)
end

