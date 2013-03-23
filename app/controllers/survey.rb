get '/survey/new' do
  erb :create_survey
end

post '/survey/new' do
  @user = current_user
  survey = Survey.new(params)
  @user.surveys << survey
  survey.save
  redirect "/survey/#{survey.id}/edit"
end

post '/survey/submit' do
  submit_answers(params)

    # @user = User.find(session[:id])
  erb :submitted
end

get '/survey/:survey_id' do
  @survey = Survey.where('id = ?', params[:survey_id]).includes(:questions => [:choices]).first
  erb :survey
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
    if param[0].match(/question*/)
      @current_question = Question.create(:content => param[1], :survey_id => @survey.id)
    elsif param[0].match(/choice*/)
      param[1].chomp.split("\r\n").each do |choice|
        Choice.create(:content => choice, :question_id => @current_question.id)
      end
    end
  end
  status 200
  "/".to_json
end


