require 'helper'
describe "/galleria" do

  before do
    get '/galleria/voorstellingen'
  end

  it 'responds' do
    status.should == 200
    content_type.should =~ %r{text/html}
  end

  pending 'uses galleria\'s flickr plugin' do
  end

end
