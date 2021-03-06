class CachedDatabase
  class CacheWithDefaults
    def initialize(cache)
      @cache = cache
    end
  
    def get(key)
      @cache[key] ||= yield
    end
  
    def delete(key)
      @cache.delete(key)
    end
    
    def clear
      @cache.clear
    end
  end
  
  def initialize
    @cache = CacheWithDefaults.new(config.cache)
  end
  
  def save(model)
    if model._rev.blank?
      create(model)
    else
      update(model)
    end
  end
end

require "db/admin"
require "db/categories"
require "db/posts"