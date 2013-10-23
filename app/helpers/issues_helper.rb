module IssuesHelper
  def openIssue_form_column(record, input_name)
    check_box :record, :openIssue, :name => input_name
  end
end
