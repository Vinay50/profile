class AddFeildsToStory < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :IsPublished, :string
    add_column :stories, :boolean, :string
    add_column :stories, :IsAchieved, :boolean
  end
end
