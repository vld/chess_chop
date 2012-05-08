class DeviseCreateAdmins < ActiveRecord::Migration
  def change
    create_table(:admins) do |t|
      t.database_authenticatable :null => false
      t.trackable
      t.lockable
      t.timestamps
    end
  end

end
