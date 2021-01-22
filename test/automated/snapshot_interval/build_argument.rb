require_relative '../automated_init'

context "Snapshot Interval" do
  context "Build Argument" do
    snapshot_interval = 1
    snapshot_class = Controls::Snapshot::Example

    context "Snapshot Interval is Declared On Store Class" do
      declared_snapshot_interval = 11
      store_class = Controls::EntityStore.example_class(snapshot_class: snapshot_class, snapshot_interval: declared_snapshot_interval)

      store = store_class.build(snapshot_interval: snapshot_interval)

      context "Store's Snapshot Interval" do
        store_snapshot_interval = store.snapshot_interval

        test "Snapshot interval argument overrides the declared one" do
          comment store_snapshot_interval.inspect
          detail "Given Snapshot Interval: #{snapshot_interval.inspect}"

          assert(store_snapshot_interval == snapshot_interval)
        end
      end
    end

    context "Snapshot Interval is Not Declared On Store Class" do
      store_class = Controls::EntityStore.example_class(snapshot_class: snapshot_class)

      store = store_class.build(snapshot_interval: snapshot_interval)

      context "Store's Snapshot Interval" do
        store_snapshot_interval = store.snapshot_interval

        test "Snapshot interval is assigned" do
          comment store_snapshot_interval.inspect
          detail "Given Snapshot Interval: #{store_snapshot_interval.inspect}"

          assert(store_snapshot_interval == snapshot_interval)
        end
      end
    end
  end
end
