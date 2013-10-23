class Byline < ActiveRecord::Base
  set_table_name :byline
  set_primary_key :BylineID

  # Callbacks
  before_create :set_key

  # Validations
  validates_presence_of :FirstName, :message => " cannot be blank."
  validates_presence_of :LastName, :message => " cannot be blank."
  validates_presence_of :GroupID, :message => " cannot be blank."
  validates_numericality_of :GroupID, :message =>" must be a number."

  # Validates the length of the inputs
  def validate
    errors.add_to_base("Your First Name is to long, can only store 30 characters!") if self.FirstName.to_s.length > 30
    errors.add_to_base("Your Last Name is to long, can only store 30 characters!")if self.LastName.to_s.length > 30
    errors.add_to_base("Your GroupID is to long, , can only store 11 characters!")if self.GroupID.to_s.length > 11
  end

  #Label used by Active Scaffold in associactions
  def to_label
    "#{self.LastName}, #{self.FirstName}"
  end

  # Associations
  has_many :articles, :foreign_key => 'BylineID'

  private

  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = Byline.find_by_sql('select max(BylineID) as maxid from byline')[0].maxid
    self.BylineID = last_key.to_i + 1
  end
end
