class Gallery < ActiveRecord::Base
  set_table_name :gallery
  set_primary_key :galleryId

  # Callbacks
  before_create :set_key

  # Validations
  validates_presence_of :issueOfPhoto, :message => " cannot be blank."
  validates_presence_of :folderOfPhoto, :message => " cannot be blank."
  validates_presence_of :nameOfGallery, :message => " cannot be blank."
  validates_numericality_of :issueOfPhoto, :message => " must be a number."

  # Validates the length of the inputs
  def validate
    errors.add_to_base("Your Name is to long, can only store 50 characters!") if self.nameOfGallery.to_s.length > 50
    errors.add_to_base("Your Folder is to long, can only store 100 characters!")if self.folderOfPhoto.to_s.length > 100
    errors.add_to_base("Your Issue ID is to long, can only store 4 characters!")if self.issueOfPhoto.to_s.length > 4
  end

  # Associations
  has_one :issue, :foreign_key => 'issueId'

  # Label used by Active Scaffold in associactions
  def to_label
    "#{nameOfGallery}"
  end

  private

  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = Gallery.find_by_sql('select max(galleryId) as maxid from gallery')[0].maxid
    self.galleryId = last_key.to_i + 1
  end
end
