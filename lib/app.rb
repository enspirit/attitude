require 'polygon'
require 'helpers'

require 'awesome_print'

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

  get %r{/(.*)} do
    serve params[:captures].first || 'balletschool'
  end

  private

    def serve(path)
      if locals = page_locals(path)
        wlang :index, :locals => locals
      else
        not_found
      end
    end

end
