class AddMatriculaToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :matricula, :string
  end

  def self.down
    remove_column :profiles, :matricula
  end
end
