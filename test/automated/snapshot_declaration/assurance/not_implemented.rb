require_relative '../../automated_init'

context "Snapshot Declaration" do
  context "Assurance" do
    context "Not Implemented" do
      snapshot_class = Controls::Snapshot::Assurance::NotImplemented::Example

      test "Doesn't raise an error" do
        refute proc { Controls::EntityStore.example(snapshot_class: snapshot_class) } do
          raises_error? Controls::Snapshot::Assurance::Error
        end
      end
    end
  end
end

