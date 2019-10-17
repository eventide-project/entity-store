require_relative 'automated_init'

context "Entity Declaration" do
  context "Entity is declared" do
    entity_class = Class.new
    store = Controls::EntityStore.example(entity_class: entity_class)

    test "Entity class is assigned to the store" do
      assert(store.entity_class == entity_class)
    end
  end

  context "Entity is not declared" do
    context "Build" do
      test "Is an error" do
        assert_raises(EntityStore::Error) do
          Controls::EntityStore.example(entity_class: :none)
        end
      end
    end
  end
end
