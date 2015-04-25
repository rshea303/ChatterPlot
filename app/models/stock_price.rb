class StockPrice < ActiveRecord::Base
  belongs_to :company

  validates :date_and_time, :price, :company_id, presence: true
end
