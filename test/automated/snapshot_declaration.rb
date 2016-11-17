require_relative 'automated_init'

context "Snapshot Declaration" do
  context "Snapshot is declared" do
    snapshot_class = Controls::Snapshot::Example
    snapshot_interval = '-1'
    store = Controls::EntityStore.example(snapshot_class: snapshot_class, snapshot_interval: snapshot_interval)

    test "Persistent store is built and assigned to the store" do
      assert(store.cache.persistent_store.instance_of? snapshot_class)
    end

    test "Snapshot interval is assigned to the store" do
      assert(store.snapshot_interval == snapshot_interval)
    end
  end

  context "Snapshot is not declared" do
    store = Controls::EntityStore.example(snapshot_class: nil, snapshot_interval: nil)

    test "Persistent store is not assigned to the store" do
      assert(store.cache.persistent_store.instance_of?(EntityCache::Storage::Persistent::None))
    end

    test "Snapshot interval is not assigned to the store" do
      assert(store.snapshot_interval.nil?)
    end
  end
end
