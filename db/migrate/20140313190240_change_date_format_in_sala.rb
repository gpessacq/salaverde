class ChangeDateFormatInSala < ActiveRecord::Migration
  def up
   change_column :salas, :fecha_festejo, :datetime
  end

  def down
   change_column :salas, :fecha_festejo, :date
  end
end
