require 'hexlet'
require 'spec_helper'

describe Hexlet::Geobaseip do
  let(:response) { load_fixture('response.xml') }
  let(:doc) { Nokogiri.XML(response) }
  subject { described_class.new(doc)}

  it '#city returns Чебоксары' do
    expect(subject.city).to eq('Чебоксары')
  end

  it '#country returns RU' do
    expect(subject.country).to eq('RU')
  end
end
