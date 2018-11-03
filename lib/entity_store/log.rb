module EntityStore
  class Log < ::Log
    def tag!(tags)
      tags << :entity_store
    end
  end
end
