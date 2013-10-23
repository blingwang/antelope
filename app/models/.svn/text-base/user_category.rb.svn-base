class UserCategory < ActiveRecord::Base
  set_table_name :usercategory
  set_primary_key :groupId

  # Validations
  validates_presence_of :groupName, :message => "cannot be blank!"

  #Label used by Active Scaffold in associactions
  def to_label
    "#{groupName}"
  end
end
