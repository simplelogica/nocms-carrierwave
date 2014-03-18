FactoryGirl.define do
  factory :no_cms_carrierwave_attachment, class: NoCms::Carrierwave::Attachment do
    attachment { File.open(File.dirname(__FILE__) + '/../../../fixtures/attachments/attachment.png') }
  end
end
