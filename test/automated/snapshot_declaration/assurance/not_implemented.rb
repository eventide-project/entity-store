require_relative '../../automated_init'

context "Snapshot Declaration" do
  context "Assurance" do
    context "Not Implemented" do
      snapshot_class = Controls::Snapshot::Assurance::NotImplemented::Example

      test "Is an error" do
        assert_raises(EntityStore::Error) do
          Controls::EntityStore.example(snapshot_class: snapshot_class)
        end
      end
    end
  end
end

