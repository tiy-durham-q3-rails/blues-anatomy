class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :doctor, index: true
      t.references :patient, index: true
      t.datetime :when

      t.timestamps
    end
  end
end
