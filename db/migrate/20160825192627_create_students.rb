class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :email, null:false, length: 50
      t.string :password

      t.timestamps null:false
    end
  end
end
