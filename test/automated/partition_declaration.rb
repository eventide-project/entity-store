require_relative 'automated_init'

context "Partition Declaration" do
  context "Partition is declared" do
    partition = 'some partition'
    store = Controls::EntityStore.example(partition: partition)

    test "Partition is assigned to the store" do
      assert(store.partition == partition)
    end
  end

  context "Partition is not declared" do
    store = Controls::EntityStore.example

    test "Partition is not assigned to the store" do
      assert(store.partition.nil?)
    end
  end
end
