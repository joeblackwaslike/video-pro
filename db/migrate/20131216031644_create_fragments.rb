class CreateFragments < ActiveRecord::Migration
  def change

    create_table :fragments do |t|
      t.string :key
      t.string :language
      t.text :content

      t.timestamps
    end
  end
end
