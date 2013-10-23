class NewsCategory < ActiveRecord::Base
  set_table_name :newscategory
  set_primary_key :newsCategoryId

  # Callbacks
  before_create :set_key
  
  # Validations
  validates_presence_of :categoryForNews
  def validate
    errors.add_to_base("Your Category for News is to long, can only store 50 characters!") if self.categoryForNews.to_s.length > 50
  end

  # Associations
  has_many :news_feeds, :foreign_key => 'category'
 
  #Label used by Active Scaffold in associactions
  def to_label
    "#{categoryForNews}"
  end

  private

  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = NewsCategory.find_by_sql('select max(newsCategoryId) as maxid from newscategory')[0].maxid
    self.newsCategoryId = last_key.to_i + 1
  end
end
