require_relative 'automated_init'

context "Entity ID Attribute Declaration" do
  context "Entity ID Attribute Is Declared" do
    context "Extant ID Attribute" do
      entity_class = Class.new do
        attr_accessor :some_id
      end

      entity_id_attribute = :some_id
      store = Controls::EntityStore.example(entity_class: entity_class, entity_id_attribute: entity_id_attribute)

      test "Entity ID attribute is assigned to the store" do
        assert(store.entity_id_attribute == entity_id_attribute)
      end
    end

    context "Non-Extant ID Attribute" do
      context "Build" do
        entity_class = Class.new
        entity_id_attribute = :some_id

        test "Is an error" do
          assert_raises(EntityStore::Error) do
            Controls::EntityStore.example(entity_class: entity_class, entity_id_attribute: entity_id_attribute)
          end
        end
      end
    end
  end

  context "Entity ID Attribute Is Not Declared" do
    entity_class = Class.new
    store = Controls::EntityStore.example(entity_class: entity_class)

    test "Entity ID attribute is not set" do
      assert(store.entity_id_attribute.nil?)
    end
  end
end
