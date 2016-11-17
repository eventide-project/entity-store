require_relative 'automated_init'

context "Snapshot Interval Declaration" do
  context "Snapshot interval is declared" do
    snapshot_interval = '-1'
    store = Controls::EntityStore.example(snapshot_interval: snapshot_interval)

    test "Snapshot interval is assigned to the store" do
      assert(store.snapshot_interval == snapshot_interval)
    end
  end

  context "Snapshot interval is not declared" do
    store = Controls::EntityStore.example(snapshot_interval: nil)

    test "Snapshot interval is not assigned to the store" do
      assert(store.snapshot_interval == nil)
    end
  end
end
