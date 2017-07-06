require_relative 'automated_init'

context "Snapshot Declaration" do
  context "Snapshot is declared" do
    snapshot_class = Controls::Snapshot::Example
    snapshot_interval = '-1'
    store = Controls::EntityStore.example(snapshot_class: snapshot_class, snapshot_interval: snapshot_interval)

    test "Snapshot class is assigned to the store" do
      assert(store.snapshot_class == snapshot_class)
    end

    test "Snapshot interval is assigned to the store" do
      assert(store.snapshot_interval == snapshot_interval)
    end

    context "Cache" do
      test "Persistent store is built and assigned to the store" do
        assert(store.cache.persistent_store.instance_of? snapshot_class)
      end

      test "Persist interval is the store's snapshot interval" do
        assert(store.cache.persist_interval == snapshot_interval)
      end
    end
  end

  context "Snapshot is not declared" do
    store = Controls::EntityStore.example(snapshot_class: nil, snapshot_interval: nil)

    test "Snapshot class is not assigned to the store" do
      assert(store.snapshot_class.nil?)
    end

    test "Snapshot interval is not assigned to the store" do
      assert(store.snapshot_interval.nil?)
    end

    context "Cache" do
      test "Inert (null) perisistent store is configured" do
        assert(store.cache.persistent_store.instance_of?(EntityCache::Store::Persistent::Null))
      end
    end
  end
end
