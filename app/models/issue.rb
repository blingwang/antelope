class Issue < ActiveRecord::Base
  set_table_name :issue
  set_primary_key :issueId

  # Callbacks
  before_create :set_key

  # Validations
  validates_presence_of :volume, :message => " cannot be blank."
  validates_numericality_of :volume, :message =>" must be a number."
  validates_presence_of :number, :message => " cannot be blank."
  validates_numericality_of :number, :message =>" must be a number."
  validates_presence_of :issueDate, :message => " cannot be blank."
  validates_presence_of :semester, :message => " cannot be blank."
  validates_presence_of :chosenGallery, :message => " cannot be blank."
  validates_numericality_of :chosenGallery, :message =>" must be a number."

  # Validates the length of the inputs
  def validate
    errors.add_to_base("Your Volume is to long, can only store 4 characters!") if self.volume.to_s.length > 4
    errors.add_to_base("Your Number is to long, can only store 3 characters!")if self.number.to_s.length > 3
    errors.add_to_base("Your Semester is to long, can only store 6 characters!")if self.semester.to_s.length > 6
  end

  # Associations
  belongs_to :gallery, :foreign_key => 'chosenGallery'

  #Label used by Active Scaffold in associactions
  def to_label
    "#{issueDate}"
  end

  private

  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = Issue.find_by_sql('select max(issueId) as maxid from issue')[0].maxid
    self.issueId = last_key.to_i + 1
  end
end