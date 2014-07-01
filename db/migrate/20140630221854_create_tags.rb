class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.belongs_to :job
    	t.string :tag
      t.timestamps
    end
  end
end
