# rails create getters and setters already - fill in from the console
# rails console

class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  # create validation rules
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 3, maximum: 100}
  validates :user_id, presence: true
  
end