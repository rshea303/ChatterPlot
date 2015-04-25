class Sentiment < ActiveRecord::Base
  belongs_to :company

  validates :date_and_time, :score, :company_id, presence: true
end
