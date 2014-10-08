class KeyError
  attr_accessor :_original_hash

  def to_s
    if _original_hash
      "#{super} in #{_original_hash.class}: #{_original_hash.inspect}"
    else
      super
    end
  end
end

class Hash

  alias_method :_fetch, :fetch

  def fetch(*args, &block)
    _fetch(*args, &block)
  rescue KeyError => key_error
    key_error._original_hash = self
    raise
  end

end
