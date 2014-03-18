class CreateNoCmsCarrierwaveAttachments < ActiveRecord::Migration
  def change
    create_table :no_cms_carrierwave_attachments do |t|
      t.timestamps
    end

    create_table :no_cms_carrierwave_attachment_translations do |t|
      t.belongs_to :no_cms_carrierwave_attachment, index: { name: 'no_cms_carr_img_on_translations' }
      t.string :locale
      t.string :attachment
    end
  end
end
