class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.date :date_of_birth
      t.string :section
      t.integer :promotion_id

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
