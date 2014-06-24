class AddBioToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :bio, :text
    add_column :doctors, :taciturn, :boolean, :default => false
  end
end
