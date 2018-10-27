require_relative '../../automated_init'

context "Snapshot Declaration" do
  context "Assurance" do
    context "Not Assured" do
      snapshot_class = Controls::Snapshot::Assurance::NotAssured::Example

      test "Raises an error" do
        assert proc { Controls::EntityStore.example(snapshot_class: snapshot_class) } do
          raises_error? Controls::Snapshot::Assurance::Error
        end
      end
    end
  end
end

