module NoCms::Carrierwave
  class Attachment < ActiveRecord::Base
    translates :attachment, :name, :description

    accepts_nested_attributes_for :translations
    delegate :attachment, :attachment=, :attachment_url, :attachment_cache, :attachment?, to: :translation
    Translation.mount_uploader :attachment, AttachmentUploader

    class Translation

      # We need to take into account the remove_attachment virtual attribute or else translations won't be saved
      def changed?
        super || !self.remove_attachment.blank?
      end

    end

    validates :attachment, presence: true

    def dup
      new_attachment = super
      self.translations.each do |translation|
        new_attachment.translation_for(translation.locale).remote_attachment_url = translation.attachment_url
      end
      new_attachment
    end
  end
end
