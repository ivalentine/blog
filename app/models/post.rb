class Post < ActiveRecord::Base
  validates :title, :text, :slug, presence: true
end
