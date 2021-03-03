class Property < ApplicationRecord
  validates :name, presence: true
  validates :rental_price, presence: true
  validates :tenant_name, presence: true
  validates :tenant_email, presence: true
  validates :status, presence: true, inclusion: { in: %w[published available deleted],
                                                  message: '%{value} is not a valid status' }
end
