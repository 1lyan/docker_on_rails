class CreateExcavators < ActiveRecord::Migration[6.0]
  def change
    create_table :excavators do |t|
      t.integer :ticket_id
      t.string :company_name
      t.string :address
      t.boolean :crew_on_site
    end
  end
end
