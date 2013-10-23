class NewsFeedsController < ApplicationController

  before_filter :authenticate

  active_scaffold :news_feed do |config|
    config.list.columns = [:title, :news_category]
    config.columns = [:title, :moreTitle, :news_category,  :link, :feedUrl, :logo]
    config.label = "News Feeds:"
    config.columns[:title].label = "Title:"
    config.columns[:category].label = "Category:"
    config.columns[:news_category].form_ui = :select
    config.columns[:news_category].clear_link
    config.columns[:logo].label = "Logo:"
    config.columns[:feedUrl].label = "URL of Feed:"
    config.columns[:moreTitle].label = "Sub-Title:"
    config.columns[:link].label = "Link:"
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
