class AddAvatarToBlog < ActiveRecord::Migration
  def up
    add_attachment :blogs, :avatar
  end

  def down
    remove_attachment :blogs, :avatar
  end
end
