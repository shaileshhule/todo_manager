# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.to_displayable_list
  end

  def show
    id = params[:id]
    render plain: User.show_single(id)
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    if User.where(email: email).present?
      render plain: "User with #{email} is already exists."
    else
      new_user = User.create!(
        name: name,
        email: email,
        password: password,
      )
      render plain: "New user created, User id:#{new_user.id} name:#{new_user.name} email:#{new_user.email}"
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    is_exist = User.login(email: email, password: password)
    render plain: is_exist
  end
end
