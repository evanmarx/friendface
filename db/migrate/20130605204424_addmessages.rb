class Addmessages < ActiveRecord::Migration
  def change 
  	create_table :messages do |t|
  		t.integer :user_id
  		t.integer :recipient_id
  		t.text 		:body
  		t.boolean :read

  		t.timestamps
  	end

  	add_index :messages, :user_id
  	add_index :messages, :recipient_id
  end
end
