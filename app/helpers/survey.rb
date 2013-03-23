before do
  @user = current_user
end

helpers do

  def submit_answers(params)
    if @user 
      user = @user.id
    else
      user = nil
    end
    params.each do |choice_id, value|
      Answer.create(user_id: user, choice_id: Choice.find_by_content(value).id)
    end
  end

  def question_count(question)
    counter = 0
    question.choices.each do |choice|
      counter += choice.answers.count
    end
    counter
  end
  
  def create_survey(params)
    @survey = Survey.create(title: params[:title],
                         description: params[:description],
                         user_id: @user.id)
    @survey
  end
end
