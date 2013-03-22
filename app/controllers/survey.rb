get '/survey/new' do
  erb :create_survey
end

post '/survey/new' do
  params[:user_id] = 1
  survey = Survey.create(params)
  redirect "/survey/#{survey.id}/edit"
end

get '/survey/:survey_id/edit' do
  @survey = Survey.find(params[:survey_id])
  erb :edit_survey
end

post '/survey/:survey_id/edit' do
  content_type :json
  @survey = Survey.find(params[:survey_id])

  puts params

  params.each do |param|
    if param[0][0] == "q"
      @current_question = Question.create(:content => param[1], :survey_id => @survey.id)
    elsif param[0][0] == "c"
      param[1].chomp.split("\r\n").each do |choice|
        Choice.create(:content => choice, :question_id => @current_question.id)
      end
    else
      return
    end
  end
  {}.to_json
end