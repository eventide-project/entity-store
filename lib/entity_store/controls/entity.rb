module EntityStore
  module Controls
    module Entity
      def self.example
        Current.example
      end

      class Example
        include Schema::DataStructure

        attribute :sum

        module Transformer
          def self.raw_data(instance)
            instance.to_h
          end

          def self.instance(raw_data)
            Example.build(raw_data)
          end
        end
      end

      module Cached
        def self.example
          Example.build :sum => sum
        end

        def self.add(id, store)
          entity = self.example
          version = Version::Cached.example

          store.cache.add(id, entity, version, persisted_version: version)

          return entity, version
        end

        def self.sum
          1
        end
      end

      module Current
        def self.example
          Example.build :sum => sum
        end

        def self.sum
          12
        end
      end
    end
  end
end
