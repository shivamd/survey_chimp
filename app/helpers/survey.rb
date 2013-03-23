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
      Answer.create(user_id: user, choice_id: choice_id.to_i)
    end
  end

  def create_survey(params)
    @survey = Survey.new(params)
    @user.surveys << @survey
    @survey.save
  end
end
