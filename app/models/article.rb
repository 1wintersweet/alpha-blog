# rails create getters and setters already - fill in from the console
# rails console

class Article < ActiveRecord::Base
  # create validation rules
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 3, maximum: 100}
  
end