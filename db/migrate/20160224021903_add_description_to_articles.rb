class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text
    
    # the following two columns can be added at the initial table creation with one colunm timestampe but rails will add two colimns.
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
