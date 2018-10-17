require_relative 'automated_init'

context "Substitute" do
  id = Controls::ID.example

  context "Get" do
    context "Entity has not been added" do
      store = SubstAttr::Substitute.build(Controls::EntityStore.example_class)
      entity, version = store.get(id, include: :version)

      test "Entity is nil" do
        assert(entity == nil)
      end

      test "Version indicates no stream exists" do
        assert(version == MessageStore::NoStream.name)
      end
    end

    context "Entity has been added" do
      control_entity = Controls::Entity.example
      control_version = Controls::Version.example

      store = SubstAttr::Substitute.build(Controls::EntityStore.example_class)
      store.add(id, control_entity, control_version)

      entity, version = store.get(id, include: :version)

      test "Entity is returned" do
        assert(entity == control_entity)
      end

      test "Version is returned" do
        assert(version == control_version)
      end
    end

    context "Version" do
      entity = Object.new
      control_version = Controls::Version.example

      store = SubstAttr::Substitute.build(Controls::EntityStore.example_class)
      store.add(id, entity, control_version)

      version = store.get_version id

      test "Version is returned" do
        assert(version == control_version)
      end
    end
  end

  context "Fetch" do
    context "Entity has not been added" do
      store = SubstAttr::Substitute.build(Controls::EntityStore.example_class)

      entity = store.fetch(id)

      test "New entity is returned" do
        refute(entity.nil?)
      end

      test "Entity's class it the store's entity class" do
        assert(entity.class == store.entity_class)
      end
    end
  end

  context "Delete Cache Record" do
    id = Controls::ID.example

    context "Record Is in the Cache's Internal Store" do
      record = Controls::Record.example

      store = SubstAttr::Substitute.build(Controls::EntityStore.example_class)

      internal_store = store.cache.internal_store

      assert(internal_store.empty?)
      internal_store.put(record)
      assert(internal_store.count == 1)

      record_count = internal_store.count

      deleted_record = store.delete_cache_record(id)

      test "Removes the cache record" do
        assert(internal_store.count == record_count - 1)
      end

      test "Returns cache record" do
        assert(deleted_record == record)
      end
    end

    context "Record Is Not in the Cache's Internal Store" do
      store = SubstAttr::Substitute.build(Controls::EntityStore.example_class)

      internal_store = store.cache.internal_store

      assert(internal_store.empty?)

      record_count = internal_store.count

      deleted_record = store.delete_cache_record(id)

      test "Doesn't remove a cache record" do
        assert(internal_store.count == record_count)
      end

      test "Returns nil" do
        assert(deleted_record.nil?)
      end
    end
  end
end
