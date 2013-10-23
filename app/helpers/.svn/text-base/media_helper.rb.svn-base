module MediaHelper
  def articles_form_column(record, input_name)
    select_tag("record[articles][]",
      options_for_select(Article.find(:all).collect { |cr|
          [cr.articleTitle, cr.articleId] }, record.articles.collect { |cr|
          cr.articleId}), {:multiple=>true, :size=>6})
  end
end
