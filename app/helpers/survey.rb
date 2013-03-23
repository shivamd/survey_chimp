helpers do

  def submit_answers(params)
    

    if current_user
      @user = current_user 
      user = @user.id
    else
      user = nil
    end

    params.each do |choice_id, value|
      Answer.create(user_id: user, choice_id: choice_id.to_i)
    end
  end
end
