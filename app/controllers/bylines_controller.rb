class BylinesController < ApplicationController

  before_filter :authenticate

  active_scaffold :byline do |config|
    config.columns[:FirstName].label = "First Name:"
    config.columns[:LastName].label = "Last Name:"
    config.columns[:GroupID].label = "Group Number:"
    config.columns = [:FirstName, :LastName, :GroupID]
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
