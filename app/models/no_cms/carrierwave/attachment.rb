module NoCms::Carrierwave
  class Attachment < ActiveRecord::Base
    translates :attachment, :name, :description, :attachment_url, :attachment_cache, :attachment?

    accepts_nested_attributes_for :translations
    delegate :attachment, :attachment=, to: :translation
    Translation.mount_uploader :attachment, AttachmentUploader

    class Translation

      # We need to take into account the remove_attachment virtual attribute or else translations won't be saved
      def changed?
        super || !self.remove_attachment.blank?
      end

    end

    validates :attachment, presence: true

  end
end
