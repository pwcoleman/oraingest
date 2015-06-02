require "rails_helper"

describe DatasetRdfDatastream do

  describe 'attributes' do

    before do
      @dataset = Dataset.new
      @dataset.apply_depositor_metadata('reviewer')
      @ds = @dataset.descMetadata
    end

    subject { @ds }

    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:subtitle) }
    it { is_expected.to respond_to(:abstract) }
    it { is_expected.to respond_to(:subject) }
    it { is_expected.to respond_to(:keyword) }
    it { is_expected.to respond_to(:worktype) }
    it { is_expected.to respond_to(:language) }
    it { is_expected.to respond_to(:license) }
    it { is_expected.to respond_to(:dateCopyrighted) }
    it { is_expected.to respond_to(:rightsHolder) }
    it { is_expected.to respond_to(:rightsHolderGroup) }
    it { is_expected.to respond_to(:rights) }
    it { is_expected.to respond_to(:rightsActivity) }
    it { is_expected.to respond_to(:creation) }
    it { is_expected.to respond_to(:funding) }
    it { is_expected.to respond_to(:publication) }

  end

  describe '#to_solr' do
    before do
      @dataset = Dataset.new
      @dataset.apply_depositor_metadata('reviewer')
      @ds = @dataset.descMetadata
      @ds.temporal.build
      @ds.dateCollected.build
      @ds.worktype.build
      @ds.language.build
      @ds.subject.build
      @ds.creation.build
      @ds.publication.build
      @ds.funding.build
    end

    it 'should solarize' do
      solr = @ds.to_solr
      expect(solr).to be_a(Hash)
    end
  end
end