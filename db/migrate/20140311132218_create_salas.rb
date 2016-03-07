class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.string :nombre
      t.string :apellido
      t.date :cumple
      t.string :email
      t.date :fecha_festejo
      t.string :lugar_festejo

      t.timestamps
    end
  end
end
