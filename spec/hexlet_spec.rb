require 'hexlet'

describe Hexlet do
  before do
    @ip = '95.81.209.168'
    @request = stub_request(:get, Hexlet::API_URL)
      .with(query: {ip: @ip})
      .to_return(body: load_fixture('found.xml'))
  end

  it do
    Hexlet.geobaseip(@ip)

    assert_requested @request
  end
end
