class CreateDummyCommentables < ActiveRecord::Migration[5.0]
  def change
    create_table "dummy_commentables" do |t|
      t.timestamps null: false
    end
  end
end
