class CreateKitshares < ActiveRecord::Migration[5.0]
  def change
    create_table :kitshares do |t|
      t.string :head
      t.string :title
      t.string :content
      t.string :img_url
      t.belongs_to :user

      t.timestamps
    end
  end
end
