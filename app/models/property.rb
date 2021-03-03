class Property < ApplicationRecord
  validates :name, presence: true
  validates :rental_price, presence: true
  validates :tenant_name, presence: true
  validates :tenant_email, presence: true
  validates :tenant_availability, presence: true
  validates :status, presence: true, inclusion: { in: %w[published available deleted],
                                                  message: '%{value} is not a valid status' }

  scope :filter_by_status, ->(status) { where status: status }
  scope :filter_by_max_rental_price, ->(price) { where('rental_price < ?', price) }
end
