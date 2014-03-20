class TranslatingNameAndDescriptionInNoCmsCarrierwaveAttachments < ActiveRecord::Migration
  def change
    remove_column :no_cms_carrierwave_attachments, :name
    remove_column :no_cms_carrierwave_attachments, :description
    add_column :no_cms_carrierwave_attachment_translations, :name, :string
    add_column :no_cms_carrierwave_attachment_translations, :description, :text
  end
end
