get '/survey/new' do
  erb :create_survey
end

post '/survey/new' do
  params[:user_id] = 1
  survey = Survey.create(params)
  redirect "/question/#{survey.id}/edit"
end

get '/question/:survey_id/edit' do
  @survey = Survey.find(params[:survey_id])
  erb :edit_survey
end
