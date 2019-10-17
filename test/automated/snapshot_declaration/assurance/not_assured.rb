require_relative '../../automated_init'

context "Snapshot Declaration" do
  context "Assurance" do
    context "Not Assured" do
      snapshot_class = Controls::Snapshot::Assurance::NotAssured::Example

      test "Raises an error" do
        assert_raises(Controls::Snapshot::Assurance::Error) do
          Controls::EntityStore.example(snapshot_class: snapshot_class)
        end
      end
    end
  end
end

