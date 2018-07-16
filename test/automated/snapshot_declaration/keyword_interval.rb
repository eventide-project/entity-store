require_relative '../automated_init'

context "Snapshot Declaration" do
  context "Keyword Interval" do
    snapshot_class = Controls::Snapshot::Example
    snapshot_interval = 11
    store = Controls::EntityStore.example(snapshot_class: snapshot_class, snapshot_interval_keyword: snapshot_interval)

    test "Snapshot class is assigned to the store" do
      assert(store.snapshot_class == snapshot_class)
    end

    test "Snapshot interval is assigned to the store" do
      assert(store.snapshot_interval == snapshot_interval)
    end

    context "Cache" do
      test "External store is built and assigned to the store" do
        assert(store.cache.external_store.instance_of? snapshot_class)
      end

      test "Persist interval is the store's snapshot interval" do
        assert(store.cache.persist_interval == snapshot_interval)
      end
    end
  end
end
