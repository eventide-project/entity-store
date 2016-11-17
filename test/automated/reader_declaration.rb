require_relative 'automated_init'

context "Reader Declaration" do
  context "Reader is not declared" do
    context "Build" do
      test "Is an error" do
        assert proc { Controls::EntityStore.example(reader_class: :none) } do
          raises_error? EntityStore::Error
        end
      end
    end
  end

  context "Reader is declared" do
    reader_class = Controls::Reader::Example
    store = Controls::EntityStore.example(reader_class: reader_class)

    test "Reader class is assigned to the store" do
      assert(store.reader_class == reader_class)
    end
  end
end
