class NewsCategoriesController < ApplicationController

  before_filter :authenticate

  active_scaffold :news_category do |config|
    config.label = "News Categories"
    config.columns = [:categoryForNews]
    columns[:categoryForNews].label = "Category"
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
