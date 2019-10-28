class AddColumnsToRecruiter < ActiveRecord::Migration[6.0]
  def change
    add_column :recruiters, :cname, :string
    add_column :recruiters, :discription, :text
    add_column :recruiters, :location, :string
    add_column :recruiters, :csize, :integer
  end
end
