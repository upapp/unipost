class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
