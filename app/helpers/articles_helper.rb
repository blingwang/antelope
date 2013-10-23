module ArticlesHelper
  def approved_form_column(record, input_name)
    check_box :record, :approved, :name => input_name
  end

  def Abstract_form_column(record, input_name)
    text_area :record, :Abstract, :name => input_name
  end

  def pullQuote_form_column(record, input_name)
    text_area :record, :pullQuote, :name => input_name
  end
end
