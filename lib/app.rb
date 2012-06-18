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

  get %r{/(.*)} do
    path = params[:captures].first || 'balletschool'
    path = path[0...-1] if path =~ /\/$/
    if locals = page_locals(path)
      wlang :index, :locals => locals.merge(:highlight => path.split('/'))
    else
      not_found
    end
  end

end
