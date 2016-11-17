require_relative 'automated_init'

context "Entity Declaration" do
  context "Entity is declared" do
    entity_class = Controls::Entity::Example
    store = Controls::EntityStore.example(entity_class: entity_class)

    test "Entity class is assigned to the store" do
      assert(store.entity_class == entity_class)
    end
  end

  context "Entity is not declared" do
    context "Build" do
      test "Is an error" do
        assert proc { Controls::EntityStore.example(entity_class: :none) } do
          raises_error? EntityStore::Error
        end
      end
    end
  end
end
