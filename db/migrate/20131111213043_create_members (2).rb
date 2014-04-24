class CreateMembers < ActiveRecord::Migration
  def up
    create_table :members do |t|
      t.string :nom
      t.string :prenom
      t.date :date
      t.string :adresse
      t.string :email
      t.integer :cp
      t.integer :tel
      
    end
  end

  def down
    drop_table :members
  end
end
