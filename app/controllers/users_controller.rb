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
      flash[:success] = "Oui, c'est bien #{User.find(params[:guess_id]).first_name}"
    else
      flash[:danger] = "Non, c'était #{User.find(params[:guess_id]).first_name}"
    end
    # vérifier si @user_to_guess.first_name == le prénom choisi (param : id du bouton)
    # si juste : flash "bravo"
    # si faux : flash avec prénom
    # option continuer
  end

end
