module EntityStore
  class Substitute
    include EntityStore

    def self.build
      new
    end

    def get(id, include: nil)
      record = records[id]

      EntityCache::Record.destructure(record, include)
    end

    def get_version(id)
      _, version = get id, include: :version
      version
    end

    def add(id, entity, version=nil)
      version ||= 0

      record = EntityCache::Record.new id, entity, version

      records[id] = record
    end
    alias :put :add

    def records
      @records ||= {}
    end
  end
end
