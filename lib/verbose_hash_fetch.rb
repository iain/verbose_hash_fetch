class KeyError
  attr_accessor :hash

  def to_s
    if hash
      "#{super} in #{hash.class}: #{hash.inspect}"
    else
      super
    end
  end
end

class Hash

  alias_method :_fetch, :fetch

  def fetch(*args, &block)
    _fetch *args, &block
  rescue KeyError => key_error
    key_error.hash = self
    raise
  end

end
