require 'polygon'
require 'helpers'

class App < Polygon::Base
  helpers Helpers

  get '/sitemap.xml' do
    content_type "application/xml"
    wlang :sitemap, :locals => sitemap_locals, :layout => false
  end

  get '/galleria/:gallery' do
    gallery  = params[:gallery]
    publicf  = Path(settings.public_folder)
    pictures = publicf.glob("pictures/#{gallery}/*.jpg")
    pictures = pictures.map{|f| { :src => "/#{f % publicf}" } }
    wlang :galleria, :locals => {:pictures => pictures}, :layout => false
  end

  get "/" do
    redirect '/balletschool/'
  end

  get '/uurrooster.htm' do redirect '/balletstudio/uurrooster/'  end
  get '/optredens.htm'  do redirect '/voorstellingen/'           end
  get '/historiek.htm'  do redirect '/balletschool/'             end
  get '/dansen.htm'     do redirect '/dansrichtingen/'           end
  get '/klassen.htm'    do redirect '/dansrichtingen/'           end
  get '/ingrid.htm'     do redirect '/docenten/ingrid-fonteyne/' end

  get %r{/(.*)} do
    path = params[:captures].first || 'balletschool'
    if locals = page_locals(path)
      wlang :index, :locals => locals
    else
      not_found
    end
  end

end
