class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  after_save :add_replies
  before_destroy :delete_replies

  private

  def add_replies
    article = Article.find_by_id(self.article_id)
    article.replies = article.replies + 1
    article.save
  end

  def delete_replies
    article = Article.find_by_id(self.article_id)
    article.replies = article.replies - 1
    article.save
  end
end

