class CreateWebsites < ActiveRecord::Migration[5.1]
  def change
    create_table :websites do |t|
      t.text :url
      t.text :parse_directive
      t.references :user
      t.timestamps
    end
  end
end
