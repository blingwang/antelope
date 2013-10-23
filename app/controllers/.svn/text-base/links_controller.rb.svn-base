class LinksController < ApplicationController

  before_filter :authenticate

  active_scaffold :link do |config|
    config.label = "Antelope Links:"
    columns[:linkUrl].label = "Link URL:"
    columns[:linkTitle].label = "Link Title:"
    columns[:imageAddress].label = "Image Address:"
    columns[:linkCategory].label = "Link Category:"
    columns[:defaultLink].label = "Default Link:" 
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
