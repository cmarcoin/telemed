class Pharmacists::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts "On arrive dans le create de users"
  end

  def edit
  end

  def update
  end
end