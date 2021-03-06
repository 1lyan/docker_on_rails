class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.integer :sequence_number
      t.string :request_type
      t.datetime :response_due_date
      t.string :primary_service_area_code
      t.text :additional_service_area_codes, array: true, default: []
      t.text :well_known_text
    end
  end
end
