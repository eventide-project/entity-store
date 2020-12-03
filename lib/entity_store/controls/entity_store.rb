module EntityStore
  module Controls
    module EntityStore
      def self.example(category: nil, entity_class: nil, projection_class: nil, reader_class: nil, snapshot_class: nil, snapshot_interval: nil, reader_batch_size: nil, specifier: nil)
        if category.nil? && entity_class.nil? && projection_class.nil? && reader_class.nil? && snapshot_class.nil? && snapshot_interval.nil? && reader_batch_size.nil? && specifier.nil?
          store_class = Example
        else
          store_class = example_class(category: category, entity_class: entity_class, projection_class: projection_class, reader_class: reader_class, snapshot_class: snapshot_class, snapshot_interval: snapshot_interval, reader_batch_size: reader_batch_size, specifier: specifier)
        end

        instance = store_class.build
        instance
      end

      def self.example_class(category: nil, entity_class: nil, projection_class: nil, reader_class: nil, snapshot_class: nil, snapshot_interval: nil, reader_batch_size: nil, specifier: nil)
        if category == :none
          category = nil
        else
          category ||= Controls::Category.example
        end

        if entity_class == :none
          entity_class = nil
        else
          entity_class ||= Controls::Entity::Example
        end

        if projection_class == :none
          projection_class = nil
        else
          projection_class ||= Controls::Projection::Example
        end

        if reader_class == :none
          reader_class = nil
        else
          reader_class ||= Controls::Reader::Example
        end

        if reader_batch_size == :none
          reader_batch_size = nil
        else
          reader_batch_size ||= Controls::Reader::BatchSize.example
        end

        if specifier == :none
          specifier = nil
        else
          specifier ||= Controls::Specifier.example
        end

        Class.new do
          include ::EntityStore

          category category
          entity entity_class
          projection projection_class
          reader reader_class, batch_size: reader_batch_size

          unless snapshot_class.nil?
            snapshot snapshot_class, interval: snapshot_interval
          end

          unless specifier.nil?
            specifier specifier
          end
        end
      end

      Example = self.example_class

      module Category
        def self.example
          :some_category
        end
      end

      module NoCategory
        def self.example(category=nil)
          category ||= Category.example

          Example.build(category: category)
        end

        class Example
          include ::EntityStore

          entity Controls::Entity::Example
          projection Controls::Projection::Example
          reader Controls::Reader::Example
        end
      end
    end
  end
end
