require 'helper'
describe "/sitemap.xml" do

  before do
    get '/sitemap.xml'
  end

  it 'respond' do
    status.should == 200
    content_type.should =~ %r{application/xml}
  end

  it 'contains some url entries' do
    body.should =~ %r{<url>}
  end

  it 'contains valid urls only' do
    body.scan %r{<loc>http://[^\/]+/(.*)</loc>} do |match|
      head "/#{match.first}"
      status.should == 200
    end
  end

end
