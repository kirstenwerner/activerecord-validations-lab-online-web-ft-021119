class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Nonfiction)}

  validate :title_is_clickbaity

  def title_is_clickbaity
    if title && !title.include?("Won't Believe" || "Secret" || "Top #{(/[1..9]/)}" || "Guess")
      errors.add(:clickbaity, "title is not clickbait-y enough")
    end
  end
end
