class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250  }
  validates :summary, length: { maximum: 250  }
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}

  validate :clickbait

  Clickbait_Y =[
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickbait
    if Clickbait_Y.none? {|p| p.match title}
      errors.add(:title, "Must be Clickbait")
    end
  end
end

