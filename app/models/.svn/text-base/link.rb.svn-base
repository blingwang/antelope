class Link < ActiveRecord::Base
  set_primary_key :urlId

  # Callbacks
  before_create :set_key

  # Valdiations
  validates_presence_of :linkUrl, :message => " cannot be blank."
  validates_presence_of :linkTitle, :message => " cannot be blank."
  validates_presence_of :imageAddress, :message => " cannot be blank."
  validates_presence_of :linkCategory, :message => " cannot be blank."
  validates_format_of :linkUrl, :with => URI::regexp(%w(http https)),
    :message => "Invalid URL link"

  validates_format_of :urlAd, :with => URI::regexp(%w(http https)),
    :message => "Invalid URL link in URL Ad"
  # Validates the length of the inputs
  def validate
    errors.add_to_base("Your URL Link is to long, can only store 100 characters!") if self.linkUrl.to_s.length > 100
    errors.add_to_base("Your Title is to long, can only store 50 characters!")if self.linkTitle.to_s.length > 50
    errors.add_to_base("Your Image Address is to long, can only store 100 characters!")if self.imageAddress.to_s.length > 100
    errors.add_to_base("Your Link Category is to long, can only store 20 characters!")if self.linkCategory.to_s.length > 20
  end

  private

  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = Link.find_by_sql('select max(urlId) as maxid from link')[0].maxid
    self.urlId = last_key.to_i + 1
  end
end
