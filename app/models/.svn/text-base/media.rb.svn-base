class Media < ActiveRecord::Base
  set_primary_key :photoId
  
  # Callbacks
  before_create :set_key

  # Validations
  validates_presence_of :caption, :message => " cannot be blank."
  validates_presence_of :gallery, :message => " cannot be blank."
  validates_presence_of :filetype, :message => " cannot be blank."
  validates_presence_of :photographer, :message => " cannot be blank."
  validates_presence_of :issue, :message => " cannot be blank."
  validates_presence_of :link, :message => " cannot be blank."
  validates_numericality_of :gallery,
    :message => " must be a gallery number."
  validates_numericality_of :issue,
    :message => " must be a an issue number."
  validates_numericality_of :photographer,
    :message => " must be a photographer ID number."

  # Validates the length of the inputs
  def validate
    errors.add_to_base("Your Photo ID is to long, can only store 8 characters!") if self.photoId.to_s.length > 8
    errors.add_to_base("Your Caption is to long, can only store 500 characters!")if self.caption.to_s.length > 500
    errors.add_to_base("Your Gallery Number is to long, can only store 6 characters!")if self.gallery.to_s.length > 6
    errors.add_to_base("Your Link is to long, can only store 50 characters!")if self.link.to_s.length > 50
    errors.add_to_base("Your Photographer is to long, can only store 100 characters!") if self.photographer.to_s.length > 100
    errors.add_to_base("Your Issue Number is to long, can only store 4 characters!") if self.issue.to_s.length > 4
    errors.add_to_base("Your Thumbnail name is to long, can only store 50 characters!") if self.thumbnail.to_s.length > 50
  end

  # Associations
  has_and_belongs_to_many :articles, :join_table => "articlephoto",
    :foreign_key => 'photoId', :association_foreign_key => 'articleId'

  private

  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = Media.find_by_sql('select max(photoId) as maxid from media')[0].maxid
    self.photoId = last_key.to_i + 1
  end
end
