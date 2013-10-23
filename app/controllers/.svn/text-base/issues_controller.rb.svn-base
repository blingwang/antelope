class IssuesController < ApplicationController

  before_filter :authenticate

  active_scaffold :issue do |config|
    config.list.columns = [:issueDate]
    config.columns = [:volume, :number, :issueDate, :openIssue, :semester, :gallery]
    config.columns[:gallery].label = "Gallery Chosen:"
    config.columns[:issueDate].label = "Date Issued:"
    config.columns[:number].label = "Number:"
    config.columns[:semester].label = "Semester:"
    config.columns[:gallery].ui_type = :select
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
