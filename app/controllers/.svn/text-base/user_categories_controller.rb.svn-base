class UserCategoriesController < ApplicationController

  before_filter :authenticate
  
  active_scaffold :user_category do |config|
    config.label = "User Groups"
    config.columns = [:groupName]
    columns[:groupName].label = "Group"
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
