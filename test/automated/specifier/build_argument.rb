require_relative '../automated_init'

context "Specifier" do
  context "Build Argument" do
    specifier = Controls::Specifier.example

    context "Specifier is Declared On Store Class" do
      declared_specifier = Controls::Specifier.example(random: true)

      store_class = Controls::EntityStore.example_class(specifier: declared_specifier)

      store = store_class.build(specifier: specifier)

      context "Store's Specifier" do
        store_specifier = store.specifier

        test "Specifier argument overrides the declared one" do
          comment store_specifier.inspect
          detail "Given Specifier: #{specifier.inspect}"

          assert(store_specifier == specifier)
        end
      end

      context "Store Cache's Specifier" do
        assigned_specifier = store.cache.specifier

        test "Specifier argument overrides the declared one" do
          comment assigned_specifier.inspect
          detail "Given Specifier: #{specifier.inspect}"

          assert(assigned_specifier == specifier)
        end
      end
    end

    context "Specifier is Not Declared On Store Class" do
      store_class = Controls::EntityStore.example_class(specifier: :none)

      store = store_class.build(specifier: specifier)

      context "Store's Specifier" do
        store_specifier = store.specifier

        test "Specifier argument is assigned" do
          comment store_specifier.inspect
          detail "Given Specifier: #{specifier.inspect}"

          assert(store_specifier == specifier)
        end
      end

      context "Store Cache's Specifier" do
        assigned_specifier = store.cache.specifier

        test "Specifier argument is assigned" do
          comment assigned_specifier.inspect
          detail "Given Specifier: #{specifier.inspect}"

          assert(assigned_specifier == specifier)
        end
      end
    end
  end
end
