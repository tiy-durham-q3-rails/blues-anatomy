class DropSpecialityFromDoctors < ActiveRecord::Migration
  def up
    remove_column :doctors, :speciality
  end

  def down
    add_column :doctors, :speciality, :string
  end
end
