class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :login, limit: 30
      t.string :password
      t.string :email
      t.string :cpf, null: true
      t.string :rg, null: true
      t.timestamp :createDate
      t.timestamp :updateDate, null: true
      t.text :comments, null: true

      t.timestamps null: false
    end
    add_index :users, :cpf, unique: true
  end
end
