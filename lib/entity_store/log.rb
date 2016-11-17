module EntityStore
  class Log < ::Log
    def tag!(tags)
      tags << :entity_store
      tags << :library
      tags << :verbose
    end
  end
end
