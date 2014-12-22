FactoryGirl.define do
  factory :no_cms_carrierwave_attachment, class: NoCms::Carrierwave::Attachment do
    attachment { File.open(__FILE__) } # The factory includes itself!!

    factory :no_cms_carrierwave_image do
      attachment { File.open(File.dirname(__FILE__) + '/../../../fixtures/attachments/attachment.png') }
    end

    factory :no_cms_carrierwave_animated_image do
      attachment { File.open(File.dirname(__FILE__) + '/../../../fixtures/attachments/animated-test.gif') }
    end
  end
end
