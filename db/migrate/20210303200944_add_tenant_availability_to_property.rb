class AddTenantAvailabilityToProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :tenant_availability, :jsonb, default: [], null: false
  end
end
