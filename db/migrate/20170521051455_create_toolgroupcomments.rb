class CreateToolgroupcomments < ActiveRecord::Migration[5.0]
  def change
    create_table :toolgroupcomments do |t|
      t.string :content
      t.integer :toolgroup_id
      t.belongs_to :user

      t.timestamps
    end
  end
end
