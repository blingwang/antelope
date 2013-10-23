class Articlephoto < ActiveRecord::Base
  set_table_name :articlephoto
  set_primary_key :photoId, :articleId

  # Callbacks
  before_create :set_key

  # Validations
  validates_presence_of :photoID, :articleID

  private

  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = ArticlePhoto.find_by_sql('select max(photoId) as maxid from articlephoto')[0].maxid
    self.photoId = last_key.to_i + 1
  end
end
