class Article < ActiveRecord::Base
  set_primary_key :articleId

  # Callbacks
  before_create :set_key

  # Validations
  validates_presence_of :articleTitle, :dateOfArticle, :category, :approved,
    :issueOfArticle, :authorId, :articleBody, :Abstract,
    :pullQuote
  validates_numericality_of :category, :issueOfArticle, :authorId

  # Validates the length of the inputs
  def validate
    errors.add_to_base("Your article title  is to long!") if self.articleTitle.to_s.length > 100
    #These two validation were breaking the updating feature
    #errors.add_to_base("Your Article Body is to long")if self.urlAd.to_s.length > 100
    #errors.add_to_base("Your Abstract is to long, 500 characters maximum")if self.businessContact.to_s.length > 500
    errors.add_to_base("Your pull Quote is to long")if self.pullQuote.to_s.length > 200
  end

  # Associations
  belongs_to :issue, :foreign_key => 'issueOfArticle'
  belongs_to :news_category, :foreign_key =>'category'
  belongs_to :user, :foreign_key => 'authorId'
  belongs_to :byline, :foreign_key => 'BylineID'
  has_and_belongs_to_many :medias, :join_table => "articlephoto",
    :foreign_key => 'articleId', :association_foreign_key => 'photoId'

  # Label used by Active Scaffold in associactions
  def to_label
    "#{self.articleTitle}"
  end

  private

  # Rails convention is to use an auto-incrementing key, which we don't have, so
  # we will set the key programatically
  def set_key
    last_key = Article.find_by_sql('select max(articleId) as maxid from article')[0].maxid
    self.articleId = last_key.to_i + 1
  end
end
