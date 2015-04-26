class Article < ActiveRecord::Base
  belongs_to :company

  validates :source, :title, presence: true
end
