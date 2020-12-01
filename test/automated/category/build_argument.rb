require_relative '../automated_init'

context "Category" do
  context "Build Argument" do
    category = Controls::Category.example

    context "Category is Declared On Store Class" do
      declared_category = Controls::Category.example

      store_class = Controls::EntityStore.example_class(category: declared_category)

      store = store_class.build(category: category)

      assigned_category = store.category

      test "Category argument is assigned to the store, overriding the declared one" do
        comment assigned_category.inspect
        detail "Given Category: #{category.inspect}"

        assert(assigned_category == category)
      end
    end

    context "Category is Not Declared On Store Class" do
      store_class = Controls::EntityStore.example_class(category: :none)

      store = store_class.build(category: category)

      assigned_category = store.category

      test "Category argument is assigned to the store" do
        assert(assigned_category == category)
      end
    end
  end
end
