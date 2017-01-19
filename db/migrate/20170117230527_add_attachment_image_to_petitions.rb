class AddAttachmentImageToPetitions < ActiveRecord::Migration
  def self.up
    change_table :petitions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :petitions, :image
  end
end
