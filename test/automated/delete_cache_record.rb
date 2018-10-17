require_relative 'automated_init'

context "Delete Cache Record" do
  id = Controls::ID.example

  context "Record Is in the Cache's Internal Store" do
    record = Controls::Record.example

    store = Controls::EntityStore.example

    internal_store = store.cache.internal_store

    assert(internal_store.empty?)
    internal_store.put(record)
    assert(internal_store.count == 1)

    record_count = internal_store.count

    deleted_record = store.delete_cache_record(id)

    test "Removes the cache record" do
      assert(internal_store.count == record_count - 1)
    end

    test "Returns cache record" do
      assert(deleted_record == record)
    end
  end

  context "Record Is Not in the Cache's Internal Store" do
    store = Controls::EntityStore.example

    internal_store = store.cache.internal_store

    assert(internal_store.empty?)

    record_count = internal_store.count

    deleted_record = store.delete_cache_record(id)

    test "Doesn't remove a cache record" do
      assert(internal_store.count == record_count)
    end

    test "Returns nil" do
      assert(deleted_record.nil?)
    end
  end
end
