class UsersController < ApplicationController

  before_filter :authenticate

  active_scaffold :user do |config|
    config.list.columns = [:userName, :passwordHash, :firstName,  :lastName, :title, :photo, :dateadded,
    :email, :byline, :current]

    config.columns.exclude :articles, :bylineID
    config.columns[:userName].label = "Username:"
    config.columns[:passwordHash].label = "Password"
    config.columns[:firstName].label = "First Name:"
    config.columns[:lastName].label = "Last Name:"
    config.columns[:title].label = "Title:"
    config.columns[:photo].label = "Photo:"
    config.columns[:dateadded].label = "Date Added:"
    config.columns[:email].label = "E-mail address:"
    config.columns[:byline].label = "By Line Name:"
    config.columns[:byline].ui_type = :select

    config.create.columns.add [ :password, :password_confirmation ]
    config.update.columns.add [ :password, :password_confirmation ]
  end

  def create_authorized?
    webmaster?
  end

  def update_authorized?
    webmaster?
  end

  def delete_authorized?
    webmaster?
  end
end
