require_relative 'automated_init'

context "Category Declaration" do
  context "Category is declared" do
    category = Controls::Category.example
    store = Controls::EntityStore.example(category: category)

    test "Category is assigned to the store" do
      assert(store.category == category)
    end
  end

  context "Category is not declared" do
    context "Build" do
      test "Is an error" do
        assert proc { Controls::EntityStore.example(category: :none) } do
          raises_error? EntityStore::Error
        end
      end
    end
  end
end
