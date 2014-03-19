# This migration comes from no_cms_carrierwave (originally 20140319173722)
class AddNameAndDescriptionToNoCmsCarrierwaveAttachments < ActiveRecord::Migration
  def change
    add_column :no_cms_carrierwave_attachments, :name, :string
    add_column :no_cms_carrierwave_attachments, :description, :text
  end
end
