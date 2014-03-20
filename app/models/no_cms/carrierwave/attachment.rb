module NoCms::Carrierwave
  class Attachment < ActiveRecord::Base
    translates :attachment, :name, :description, :attachment_url, :attachment_cache, :attachment?

    accepts_nested_attributes_for :translations
    delegate :attachment, :attachment=, to: :translation
    Translation.mount_uploader :attachment, AttachmentUploader

    validates :attachment, presence: true

  end
end
