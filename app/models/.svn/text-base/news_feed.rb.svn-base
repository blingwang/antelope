class NewsFeed < ActiveRecord::Base
  set_table_name :newsfeed
  set_primary_key :newsfeedId

  # Callbacks
  before_create :set_key

  # Validations
  validates_presence_of :title, :message => " cannot be blank."
  validates_presence_of :category, :message => " cannot be blank."
  validates_presence_of :feedUrl, :message => " cannot be blank."
  validates_presence_of :logo, :message => " cannot be blank."
  validates_presence_of :moreTitle, :message => " cannot be blank."
  validates_presence_of :link, :message => " cannot be blank."
  validates_numericality_of :category, :message => " must be a number."
  validates_format_of :feedUrl, :with => URI::regexp(%w(http https)),
    :message => "Invalid URL link in URL Ad"

  # Validates the length of the inputs
  def validate
    errors.add_to_base("Your Newsfeed ID is to long, can only store 4 characters!") if self.newsfeedId.to_s.length > 4
    errors.add_to_base("Your Title is to long, can only store 50 characters!")if self.title.to_s.length > 50
    errors.add_to_base("Your Category is to long, can only store 2 characters!")if self.category.to_s.length > 2
    errors.add_to_base("Your Logo is to long, can only store 50 characters!")if self.logo.to_s.length > 50
    errors.add_to_base("Your FeedUrl is to long, can only store 100 characters!") if self.feedUrl.to_s.length > 100
    errors.add_to_base("Your More Title is to long, can only store 50 characters!") if self.moreTitle.to_s.length > 50
    errors.add_to_base("Your Link name is to long, can only store 50 characters!") if self.link.to_s.length > 50
  end

  #Associations
  belongs_to :news_category, :foreign_key =>'category'

  private

  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = NewsFeed.find_by_sql('select max(newsfeedId) as maxid from newsfeed')[0].maxid
    self.newsfeedId = last_key.to_i + 1
  end
end
