class GalleriesController < ApplicationController

  before_filter :authenticate

  active_scaffold :gallery do |config|
    config.list.columns = [:nameOfGallery]
    config.columns = [:nameOfGallery, :folderOfPhoto, :issueOfPhoto]
    config.columns[:folderOfPhoto].label = "Folder Of Photos:"
    config.columns[:nameOfGallery].label = "Name of Gallery:"
    config.columns[:issueOfPhoto].label = "Issue of Photo:"
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
