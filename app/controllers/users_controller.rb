class UsersController < ApplicationController
  def new

  end

  def create
    outcome = CreateUser.run(params: user_params)

    if outcome.valid?
      redirect_to user_path(outcome.result)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  ##############################################################################

  def user_params
    params.require(:user).permit(:name, :surname, :patronymic, :age, :email,
                                 :nationality, :country, :gender, :skills,
                                 :interests)
  end
end
