class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 45
      t.string :email, limit: 45, unique: true
      t.text :password_digest, limit: nil

      t.timestamps
    end
  end
end
