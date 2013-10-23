module UsersHelper
  def current_form_column(record, input_name)
    check_box :record, :current, :name => input_name
  end

  def passwordHash_form_column(record, input_name)
    text_field :record, :passwordHash, :name => input_name
  end
end
