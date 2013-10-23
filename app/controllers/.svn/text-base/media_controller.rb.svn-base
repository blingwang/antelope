class MediaController < ApplicationController

  before_filter :authenticate

  active_scaffold :media do |config|
    config.list.columns = [:caption, :thumbnail, :dateOfPhoto]
    config.columns[:dateOfPhoto].label = "Date Taken:"
    config.columns[:caption].label = "Caption:"
    config.columns[:gallery].label = "Gallery:"
    config.columns[:filetype].label = "Type of File:"
    config.columns[:link].label = "URL:"
    config.columns[:photographer].label = "Photographer:"
    config.columns[:thumbnail].label = "Thumbnail Image:"
  end

  def create_authorized?
    student_editor?
  end

  def update_authorized?
    student_editor?
  end

  def delete_authorized?
    webmaster?
  end
end
