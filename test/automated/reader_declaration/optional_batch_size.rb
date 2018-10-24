require_relative '../automated_init'

context "Reader Declaration" do
  context "Optional Batch Size" do
    context "Supplied" do
      batch_size = Controls::Reader::BatchSize.example

      store = Controls::EntityStore.example(reader_batch_size: batch_size)

      test "Given batch size is assigned to store" do
        assert(store.reader_batch_size == batch_size)
      end
    end

    context "Omitted" do
      store = Controls::EntityStore.example(reader_batch_size: :none)

      test "Read batch size is set to the default" do
        assert(store.reader_batch_size == EntityStore::Defaults.batch_size)
      end
    end
  end
end
