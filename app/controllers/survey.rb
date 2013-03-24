get '/survey/new' do
  erb :create_survey
end

post '/survey/new' do
  survey = create_survey(title: params[:title], description: params[:description])
  
  File.open('public/images/' + params['filename'][:filename], "w") do |f|
    f.write(params['filename'][:tempfile].read)
  end

  if params[:title] == "" || params[:description] == ""
    @errors = "Yo man... you can't create a blank survey! Please add a title and a description."
    erb :create_survey
  else
    survey = create_survey(title: params[:title], description: params[:description])
    
    # File.open('public/images/' + params['filename'][:filename], "w") do |f|
    #   f.write(params['filename'][:tempfile].read)
    # end
    survey.photo = Photo.create(name: params[:filename])
    redirect "/survey/#{@survey.id}/edit"
  end
end

post '/survey/submit' do
  submit_answers(params)
  erb :submitted
end

get '/survey/:survey_id' do
  surveys = Survey.includes(:questions => [:choices])
  @survey = surveys.find(params[:survey_id])
  erb :survey
end

get '/survey/:survey_id/stats' do 
  @survey = Survey.find(params[:survey_id])
  erb :stats
end

get '/survey/:survey_id/edit' do
  @survey = Survey.find(params[:survey_id])
  erb :edit_survey
end

### Can someone refactor this into a helper?
post '/survey/:survey_id/edit' do
  content_type :json
  @survey = Survey.find(params[:survey_id])
  params.each do |param|
    if param[0].match(/question*/)
      @current_question = Question.create(:content => param[1], :survey_id => @survey.id)
    elsif param[0].match(/choice*/)
      param[1].chomp.split("\r\n").each do |choice|
        Choice.create(:content => choice, :question_id => @current_question.id)
      end
    end
  end
  status 200
  "/users/profile".to_json
end
