module NoCms::Carrierwave
  class Attachment < ActiveRecord::Base
    translates :attachment

    delegate :attachment, :attachment=, to: :translation
    Translation.mount_uploader :attachment, AttachmentUploader

    validates :attachment, presence: true

  end
end
