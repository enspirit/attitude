module Helpers

  def entry2path(entry)
    path = entry.relative_path.rm_ext
    path = entry.index? ? path.parent : path
    path == Path('.') ? Path("") : path
  end

  def sitemap
    entry2path = lambda{|f| entry2path(f) }
    lispy do
      (extend :entries,
              :path    => proc{ entry2path.call(entry)                },
              :lastmod => proc{ entry.path.mtime.strftime("%Y-%m-%d") })
    end
  end

  def sitemap_locals
    { :urls => sitemap }
  end

  def page_locals(path)
    sitemap = self.sitemap
    rel = lispy do
      (unwrap \
        (extend (restrict sitemap, :path => Path(path)),
                :data => lambda{ entry.to_hash }),
        :data)
    end
    rel.to_a.first
  end

end
