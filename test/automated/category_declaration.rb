require_relative 'automated_init'

context "Category Declaration" do
  context "Category is declared" do
    category = 'some category'
    store = Controls::EntityStore.example(category: category)

    test "Category is assigned to the store" do
      assert(store.category == category)
    end
  end

  context "Category is not declared" do
    context "Build" do
      test "Is an error" do
        assert_raises EntityStore::Error do
          Controls::EntityStore.example(category: :none)
        end
      end
    end
  end
end
