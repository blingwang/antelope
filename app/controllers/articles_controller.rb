class ArticlesController < ApplicationController

  before_filter :authenticate

  active_scaffold :article do |config|
     
    # Displays
    config.list.columns = [:articleTitle, :dateOfArticle, :issue, :user, :byline]
    config.columns[:issue].form_ui = :select
    config.columns[:news_category].form_ui = :select
    config.columns[:byline].form_ui = :select
    config.columns[:user].form_ui = :select

    # Labeling the files so better undersood what is displayed
    columns[:articleTitle].label = "Title"
    columns[:dateOfArticle].label = "Date of Article"
    columns[:approved].label = "Approved"
    columns[:user].label = "Author ID"
    columns[:articleBody].label = "Body"
    columns[:Abstract].label = "Abstract"
    columns[:pullQuote].label = "Pull Quote"

    # Link to associated files cannot be modified on this form
    config.columns[:byline].clear_link
    config.columns[:user].clear_link
    config.columns[:issue].clear_link
    config.columns[:user].clear_link
    config.columns = [:articleTitle, :dateOfArticle, :news_category, :approved, :issue, :user, :dateOfArticle, :articleBody, :Abstract, :pullQuote, :byline]
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
