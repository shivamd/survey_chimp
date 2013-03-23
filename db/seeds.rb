ryan   = User.create(username:  "ryan", 
                     email:     "ryan@ryan.com", 
                     password:  "ryan")
david  = User.create(username:  "david", 
                     email:     "david@david.com", 
                     password:  "david")
phil   = User.create(username:  "phil", 
                     email:     "phil@phil.com", 
                     password:  "phil")
shivam = User.create(username:  "shivam", 
                     email:     "shivam@shivam.com", 
                     password:  "shivam")

16.times do 
  Survey.create(title:        Faker::Lorem.sentence(num = rand(5) + 4),
                description:  Faker::Lorem.sentences,
                user_id:      rand(1..4))
end
  
64.times do
  Question.create(content:    Faker::Lorem.sentence(num = rand(5) + 4), 
                  survey_id:  rand(1..16))
end 
    
204.times do
  Choice.create(content:      Faker::Lorem.word, 
                question_id:  rand(1..64))
end
    
408.times do
  Answer.create(user_id:      rand(1..4), 
                choice_id:    rand(1..204))
end

