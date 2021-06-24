require 'helper'
describe "/fotos/voorstellingen/" do

  before do
    get '/fotos/voorstellingen/'
    follow_redirect! if status==302
  end

  it 'responds' do
    status.should == 200
  end

end
