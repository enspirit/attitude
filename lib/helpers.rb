module Helpers

  def page_locals(path)
    highlight  = path.split('/').compact.reject{|s| s.empty?}
    normalized = highlight.join('/')
    return unless h = super(normalized)
    h = h.merge(:highlight => highlight)
    if h["layout"] == "voorstellingen"
      h[:id] = highlight.last
      children = h[:entry].path.parent.glob("*.md").map{|path|
        path.basename.to_s
      } - ["index.md"]
      h[:voorstellingen] = children.sort.reverse.map{|child|
        (h[:entry]/".."/child).send(:data).merge(id: child[0..-4])
      }
    end
    h
  end

end
