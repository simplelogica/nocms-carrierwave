# encoding: utf-8
module NoCms::Carrierwave
  class AttachmentUploader < CarrierWave::Uploader::Base

    # Include RMagick or MiniMagick support:
    # include CarrierWave::RMagick
    include CarrierWave::MiniMagick

    # Choose what kind of storage to use for this uploader:
    storage NoCms::Carrierwave.storage
    # storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Provide a default URL as a default if there hasn't been a file uploaded:
    # def default_url
    #   # For Rails 3.1+ asset pipeline compatibility:
    #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    #
    #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    # end

    # Process files as they are uploaded:
    # process :scale => [200, 300]
    #
    # def scale(width, height)
    #   # do something
    # end

    # We create all the image versions from the NoCms::Carrierwave configuration
    NoCms::Carrierwave.images_versions.each do |version_name, size|
      version version_name, if: :image_with_versions? do
        process :resize_to_fit => size
      end
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    # def extension_white_list
    #   %w(jpg jpeg gif png)
    # end

    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    # def filename
    #   "something.jpg" if original_filename
    # end


    def image_with_versions?(new_file = self.file)
      # If we have no file it's not an image
      return false if new_file.nil?

      # If it doesn't have an image mimetype is not an image
      return false unless new_file.content_type.include? 'image'

      # If we don't have to avoid animated gif resizing we can return true now
      return true unless NoCms::Carrierwave.disable_animated_gif_versions

      # If we have to avoid it but we don't have a gif we return
      return true unless new_file.content_type.ends_with? 'gif'

      # If we have to disable it we must check if it's animated.
      # In order to do so we collapse the image and see if it has a different size

      image_to_upload = MiniMagick::Image.open(new_file.path)

      whole_file_collapsed_size = image_to_upload.collapse!(nil).size
      first_frame_collapsed_size = image_to_upload.collapse!.size

      return whole_file_collapsed_size == first_frame_collapsed_size

    end

  end
end
