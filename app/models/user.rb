class User < ActiveRecord::Base
  set_table_name :user
  set_primary_key :userId
  # Callbacks
  before_create :set_key

  attr_accessor :password, :password_confirmation

  validates_presence_of :password, :password_confirmation

  def before_save
    self.passwordHash = password if password
  end

  # Validations
  validates_presence_of :userName , :message => " cannot be blank."
  validates_presence_of :passwordHash , :message => " cannot be blank."
  validates_presence_of :firstName , :message => " cannot be blank."
  validates_presence_of :lastName , :message => " cannot be blank."
  validates_presence_of :title , :message => " cannot be blank."
  validates_presence_of :dateadded , :message => " cannot be blank."
  validates_presence_of :email , :message => " cannot be blank."
  #  validates_numericality_of  :bylineID , :message => " must be a number."

  # Validates the length of the inputs
  def validate
    errors.add_to_base('password', 'and confirmation do not match') unless password_confirmation == password
    errors.add_to_base("Your User ID is to long, can only store 4 characters!") if self.userId.to_s.length > 4
    errors.add_to_base("Your User Name is to long, can only store 50 characters!")if self.userName.to_s.length > 50
    errors.add_to_base("Your First Name is to long, can only store 50 characters!")if self.firstName.to_s.length > 50
    errors.add_to_base("Your Last Name is to long, can only store 50 characters!")if self.lastName.to_s.length > 50
    errors.add_to_base("Your Title is to long, can only store 50 characters!") if self.title.to_s.length > 50
    errors.add_to_base("Your Photo is to long, can only store 50 characters!") if self.photo.to_s.length > 50
    errors.add_to_base("Your Email is to long, can only store 30 characters!") if self.email.to_s.length > 30
    errors.add_to_base("Your Byline ID is to long, can only store 11 characters!") if self.bylineID.to_s.length > 11
  end

  # Associations
  has_many :articles, :foreign_key => 'authorId'
  belongs_to :byline, :foreign_key => 'bylineID'

  #Label used by Active Scaffold in associactions
  #  def to_label
  #    "#{self.lastName}, #{self.firstName}"
  #  end

  private

  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = User.find_by_sql('select max(userId) as maxid from user')[0].maxid
    self.userId = last_key.to_i + 1
  end
end
