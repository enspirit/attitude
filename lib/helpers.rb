module Helpers

  def sitemap_locals
    { :urls => database.sitemap }
  end

  def page_locals(path = "")
    rel = lispy do
      (unwrap \
        (extend (restrict :sitemap, :path => path),
                :data => lambda{ entry.to_hash }),
        :data)
    end
    rel && rel.to_a.first
  end
  alias :index_locals :page_locals

end
