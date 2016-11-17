require_relative 'automated_init'

context "Snapshot Declaration" do
  context "Snapshot is declared" do
    snapshot_class = Controls::Snapshot::Example
    store = Controls::EntityStore.example(snapshot_class: snapshot_class)

    test "Persistent store is built and assigned to the store" do
      assert store.cache.persistent_store.instance_of?(snapshot_class)
    end
  end

  context "Snapshot is not declared" do
    store = Controls::EntityStore.example(snapshot_class: nil)

    test "Persistent store is not assigned to the store" do
      assert store.cache.persistent_store.instance_of?(EntityCache::Storage::Persistent::None)
    end
  end
end
