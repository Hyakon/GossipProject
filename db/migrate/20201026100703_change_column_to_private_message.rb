class ChangeColumnToPrivateMessage < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :private_messages, :recipient, index: true
  end
end
