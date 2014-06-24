class ChangeNameFieldToLastNameAndFirstName < ActiveRecord::Migration
  def up
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string

    Doctor.all.each do |doctor|
      doctor.first_name, doctor.last_name = doctor.name.split(" ")
      doctor.save
    end

    remove_column :doctors, :name
  end

  def down
    add_column :doctors, :name, :string

    Doctor.all.each do |doctor|
      doctor.name = [doctor.first_name, doctor.last_name].join(" ")
      doctor.save
    end

    remove_column :doctors, :first_name
    remove_column :doctors, :last_name
  end
end
