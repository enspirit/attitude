module Helpers

  def page_locals(path)
    highlight  = path.split('/').compact.reject{|s| s.empty?}
    normalized = highlight.join('/')
    if h = super(normalized)
      h.merge(:highlight => highlight)
    end
  end

end
