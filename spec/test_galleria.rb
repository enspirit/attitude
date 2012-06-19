require 'helper'
describe "/galleria" do

  before do
    get '/galleria/voorstellingen'
  end

  it 'responds' do
    status.should == 200
    content_type.should =~ %r{text/html}
  end

  it 'contains some img entries' do
    body.should =~ %r{<img src="/pictures/voorstellingen/}
  end

end
