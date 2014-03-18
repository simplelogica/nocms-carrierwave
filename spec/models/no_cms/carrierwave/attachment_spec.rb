require 'spec_helper'

describe NoCms::Carrierwave::Attachment do

  it_behaves_like "model with required attributes", :no_cms_carrierwave_attachment, [:attachment]

  context 'when saving an attachment' do

    let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_attachment)) }

    subject { attachment }

    it "should store it as a carrierwave attachment" do
      expect(subject.attachment).to be_a NoCms::Carrierwave::AttachmentUploader
    end

  end
end
