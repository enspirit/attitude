require 'polygon'
require 'helpers'

require 'awesome_print'

class App < Polygon::Base
  helpers Helpers

  get '/sitemap.xml' do
    content_type "application/xml"
    wlang :sitemap, :locals => sitemap_locals, :layout => false
  end

  get "/" do
    wlang :index, :locals => page_locals('balletschool')
  end

  get "/:page" do
    wlang :index, :locals => page_locals(params[:page])
  end

end
