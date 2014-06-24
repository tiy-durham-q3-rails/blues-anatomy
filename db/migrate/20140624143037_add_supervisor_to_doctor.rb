class AddSupervisorToDoctor < ActiveRecord::Migration
  def change
    add_reference :doctors, :supervisor
    # same as
    # add_column :doctors, :supervisor_id, :integer
  end
end
