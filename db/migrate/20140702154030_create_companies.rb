class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|

    	t.string :name
    	t.string :career_url
    	t.string :email
    	
      t.timestamps
    end
  end
end
