require_relative 'automated_init'

context "Projection Declaration" do
  context "Projection is declared" do
    projection_class = Class.new
    store = Controls::EntityStore.example(projection_class: projection_class)

    test "Projection class is assigned to the store" do
      assert(store.projection_class == projection_class)
    end
  end

  context "Projection is not declared" do
    context "Build" do
      test "Is an error" do
        assert_raises EntityStore::Error do
          Controls::EntityStore.example(projection_class: :none)
        end
      end
    end
  end
end
