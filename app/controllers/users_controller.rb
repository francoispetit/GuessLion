class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def quiz
    @users_guessed = []
    @users_not_guessed = []
    @name_list = []
    @name_proposal = []

    User.all.each do |user|
      if current_user.stats == {}
        current_user.stats[:guessed_names] = []
        @users_not_guessed << user.id
      else
        if current_user.stats[:guessed_names].include?(user.id)
          @users_guessed << user.id

        else
          @users_not_guessed << user.id

        end
        @name_list << user.first_name
      end

    end



    @users_not_guessed.delete(current_user.id)

    @user_to_guess = User.find(@users_not_guessed.take(1))
    @name_list.delete(@user_to_guess[0].first_name)

    @name_proposal = @name_list.take(3) << @user_to_guess[0].first_name
  end

  def check
    if params[:commit] == User.find(params[:guess_id]).first_name
      current_user.stats[:guessed_names] << params[:guess_id].to_i
      current_user.save
      flash[:success] = "Oui, c'est bien #{User.find(params[:guess_id]).first_name}"

    else
      flash[:danger] = "Non, c'était #{User.find(params[:guess_id]).first_name}"
    end
    # vérifier si @user_to_guess.first_name == le prénom choisi (param : id du bouton)
    # si juste : flash "bravo"
    # si faux : flash avec prénom
    # option continuer
  end

  def quiz_fun
    @users_fun_guessed = []
    @users_fun_not_guessed = []
    @fun_list = []
    @fun_proposal = []

    User.all.each do |user|
      if current_user.stats == {} || current_user.stats[:guessed_fun] == nil
        current_user.stats[:guessed_fun] = []
        @users_fun_not_guessed << user.id
      else
        if current_user.stats[:guessed_fun].include?(user.id)
          @users_fun_guessed << user.id
        else
          @users_fun_not_guessed << user.id
        end
        @fun_list << user.fun_fact_one
      end
    end

    @users_fun_not_guessed.delete(current_user.id)

    @user_fun_to_guess = User.find(@users_fun_not_guessed.take(1))
    @fun_list.delete(@user_fun_to_guess[0].fun_fact_one)

    @fun_proposal = @fun_list.take(3) << @user_fun_to_guess[0].fun_fact_one
  end

  def check_fun
    if params[:commit] == User.find(params[:guess_id]).fun_fact_one
      current_user.stats[:guessed_fun] << params[:guess_id].to_i
      current_user.save
      flash[:success] = "Oui, c'est bien ça"
    else
      flash[:danger] = "Non, va lui demander !"
    end
  end

end
