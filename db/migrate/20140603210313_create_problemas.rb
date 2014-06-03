class CreateProblemas < ActiveRecord::Migration
  def change
    create_table :problemas do |t|
      t.integer :thermostat_id
      t.text :description
      t.string :status
      t.text :resolution

      t.timestamps
    end
  end
end
