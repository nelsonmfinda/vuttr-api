class CreateTools < ActiveRecord::Migration[5.2]
  def change
    create_table :tools do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :tags, array: true

      # t.timestamps
    end
  end
end
