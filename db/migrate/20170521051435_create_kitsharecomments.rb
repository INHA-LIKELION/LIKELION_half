class CreateKitsharecomments < ActiveRecord::Migration[5.0]
  def change
    create_table :kitsharecomments do |t|
      t.string :content
      t.integer :kitshare_id
      t.belongs_to :user

      t.timestamps
    end
  end
end
