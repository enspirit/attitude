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

  get "/*" do
    path = params[:captures].first || 'balletschool'
    if locals = page_locals(path)
      wlang :index, :locals => locals
    else
      not_found
    end
  end

end
