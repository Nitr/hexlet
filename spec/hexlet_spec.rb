require 'hexlet'
require 'spec_helper'

describe Hexlet do
  let(:ip) { '95.81.209.168' }
  let(:response) { load_fixture('response.xml') }
  before do
    allow(OpenURI).to receive(:open_uri).and_return(response)
  end

  context '.geobaseip' do
    subject { described_class.geobaseip(ip)}

    it { is_expected.to be_instance_of(Hexlet::Geobaseip) }
  end
end
