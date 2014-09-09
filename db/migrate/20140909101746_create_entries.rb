class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :english
      t.string :thai

      t.timestamps
    end
  end
end
