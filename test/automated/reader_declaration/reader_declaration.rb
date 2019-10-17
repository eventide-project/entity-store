require_relative '../automated_init'

context "Reader Declaration" do
  context "Reader is declared" do
    reader_class = Class.new
    store = Controls::EntityStore.example(reader_class: reader_class)

    test "Reader class is assigned to the store" do
      assert(store.reader_class == reader_class)
    end
  end

  context "Reader is not declared" do
    context "Build" do
      test "Is an error" do
        assert_raises(EntityStore::Error) do
          Controls::EntityStore.example(reader_class: :none)
        end
      end
    end
  end
end
