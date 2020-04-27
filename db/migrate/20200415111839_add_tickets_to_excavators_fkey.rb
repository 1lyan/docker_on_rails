class AddTicketsToExcavatorsFkey < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key 'excavators', 'tickets'
  end
end
