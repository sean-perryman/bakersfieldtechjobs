class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :title
    	t.text :description
    	t.datetime :date_posted
    	t.string :company, :contact_name, :contact_email, :contact_phone
    	t.integer :owner
    	t.boolean :active
      t.timestamps
    end
  end
end
