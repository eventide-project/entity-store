require_relative '../automated_init'

context "Specifier Declaration" do
  context "Specifier is declared" do
    specifier = Controls::Specifier.example
    store = Controls::EntityStore.example(specifier: specifier)

    test "Specifier is assigned to the store" do
      assert(store.specifier == specifier)
    end
  end

  context "Specifier is not declared" do
    store = Controls::EntityStore.example(specifier: :none)

    test "Specifier is not assigned to the store" do
      assert(store.specifier.nil?)
    end
  end
end
