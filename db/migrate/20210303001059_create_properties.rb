class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :description
      t.integer :rental_price
      t.string :status
      t.string :tenant_name
      t.string :tenant_email
      t.string :tenant_phone

      t.timestamps
    end
  end
end
