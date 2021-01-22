require_relative '../automated_init'

context "Snapshot Interval" do
  context "Snapshot interval is declared" do
    snapshot_class = Controls::Snapshot::Example
    snapshot_interval = 1
    store = Controls::EntityStore.example(snapshot_class: snapshot_class, snapshot_interval: snapshot_interval)

    test "Snapshot interval is assigned to the store" do
      assert(store.snapshot_interval == snapshot_interval)
    end
  end
end
