class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.date :date
      t.string :shift
      t.integer :age
      t.string :gender
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
