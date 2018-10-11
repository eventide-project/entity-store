require_relative '../automated_init'

context "Reader Declaration" do
  context "Optional Batch Size" do
    context "Supplied" do
      batch_size = Controls::Reader::BatchSize.example

      context "Positional Argument" do
        store = Controls::EntityStore.example(read_batch_size: batch_size)

        test "Given batch size is assigned to store" do
          assert(store.read_batch_size == batch_size)
        end
      end

      context "Keyword Argument" do
        store = Controls::EntityStore.example(read_batch_size_keyword: batch_size)

        test "Given batch size is assigned to store" do
          assert(store.read_batch_size == batch_size)
        end
      end
    end

    context "Omitted" do
      store = Controls::EntityStore.example(read_batch_size: :none)

      test "Read batch size is not set on store" do
        assert(store.read_batch_size.nil?)
      end
    end
  end
end
