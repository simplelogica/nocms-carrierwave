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

  context 'when saving an image' do

    let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_image)) }

    subject { attachment }

    it "should create versions" do
      expect(subject.attachment.thumb.url).to_not eq subject.attachment.url
      expect(subject.attachment.thumb.url).to_not be_nil
    end

    it "should not make up versions" do
      expect{subject.attachment.thumb_fake}.to raise_error NoMethodError
    end

  end

  context 'when saving an attachment (not image)' do

    let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_attachment)) }

    subject { attachment }

    it "should not create versions" do
      expect(subject.attachment.thumb.url).to be_nil
    end

  end

  context 'when animated gif versions are disabled' do

    before { NoCms::Carrierwave.disable_animated_gif_versions = true }

    context 'when saving an animated gif' do

      let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_animated_image)) }

      subject { attachment }

      it "should not create versions" do
        expect(subject.attachment.thumb.url).to be_nil
      end

    end

    context 'when saving an static gif' do

      let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_static_gif)) }

      subject { attachment }

      it "should create versions" do
        expect(subject.attachment.thumb.url).to_not eq subject.attachment.url
        expect(subject.attachment.thumb.url).to_not be_nil
      end
    end
  end

  context 'when animated gif versions are disabled' do

    before { NoCms::Carrierwave.disable_animated_gif_versions = false }

    context 'when saving an animated gif' do

      let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_animated_image)) }

      subject { attachment }

      it "should create versions" do
        expect(subject.attachment.thumb.url).to_not eq subject.attachment.url
        expect(subject.attachment.thumb.url).to_not be_nil
      end

    end
  end

  context 'when duplicating an attachment' do

    let(:attachment_attributes) { attributes_for(:no_cms_carrierwave_attachment) }

    let!(:attachment) { NoCms::Carrierwave::Attachment.create(attachment_attributes) }

    before do
      # We have to stub the attachment_url, so the image can be duplicated
      allow_any_instance_of(NoCms::Carrierwave::Attachment::Translation).to receive(:attachment_url).and_return('https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150')
    end

    subject { attachment.dup }

    it "should save" do
      expect{subject.save!}.to_not raise_error
    end

    it "should have the same attachment attributes" do
      attachment_attributes.each do |attribute_name, attribute_value|
        # we can't test attachment equalness since it's been stubbed before
        expect(subject.send(attribute_name)).to eq attribute_value unless attribute_name == :attachment
      end
    end

  end
end
