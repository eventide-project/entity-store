require_relative '../automated_init'

context "New Entity" do
  context "Factory method is defined on the entity class" do
    id = Controls::ID.example
    entity_class = Class.new do
      attr_accessor :build_called

      def self.build
        instance = new
        instance.build_called = true
        instance
      end
    end

    store = Controls::EntityStore.example(entity_class: entity_class)

    entity = store.new_entity(id)

    test "Factory method is used" do
      assert(entity.build_called)
    end
  end

  context "No factory method is defined on the entity class" do
    id = Controls::ID.example
    entity_class = Class.new

    store = Controls::EntityStore.example(entity_class: entity_class)

    entity = store.new_entity(id)

    test "Entity is instantiated" do
      assert(entity.is_a?(entity_class))
    end
  end

  context "ID attribute is supplied" do
    id = Controls::ID.example

    entity_class = Class.new do
      attr_accessor :some_id
    end

    store = Controls::EntityStore.example(entity_class: entity_class, entity_id_attribute: :some_id)

    entity = store.new_entity(id)

    test "ID is set" do
      assert(entity.some_id == id)
    end
  end
end
