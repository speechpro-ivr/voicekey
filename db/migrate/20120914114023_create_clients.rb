class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :ani
      t.string :card_id

      t.timestamps
    end
  end
end
