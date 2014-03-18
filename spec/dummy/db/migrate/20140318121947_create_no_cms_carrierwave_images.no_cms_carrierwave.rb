# This migration comes from no_cms_carrierwave (originally 20140318115123)
class CreateNoCmsCarrierwaveImages < ActiveRecord::Migration
  def change
    create_table :no_cms_carrierwave_images do |t|
      t.timestamps
    end

    create_table :no_cms_carrierwave_image_translations do |t|
      t.belongs_to :no_cms_carrierwave_image, index: { name: 'no_cms_carr_img_on_translations' }
      t.string :locale
      t.string :image
    end
  end
end
