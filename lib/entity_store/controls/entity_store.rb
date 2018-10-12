module EntityStore
  module Controls
    module EntityStore
      def self.example(category: nil, entity_class: nil, projection_class: nil, reader_class: nil, snapshot_class: nil, snapshot_interval: nil, snapshot_interval_keyword: nil, reader_batch_size: nil)
        if category.nil? && entity_class.nil? && projection_class.nil? && reader_class.nil? && snapshot_class.nil? && snapshot_interval.nil? && snapshot_interval_keyword.nil? && reader_batch_size.nil?
          store_class = Example
        else
          store_class = example_class(category: category, entity_class: entity_class, projection_class: projection_class, reader_class: reader_class, snapshot_class: snapshot_class, snapshot_interval: snapshot_interval, snapshot_interval_keyword: snapshot_interval_keyword, reader_batch_size: reader_batch_size)
        end

        instance = store_class.build
        instance
      end

      def self.example_class(category: nil, entity_class: nil, projection_class: nil, reader_class: nil, snapshot_class: nil, snapshot_interval: nil, snapshot_interval_keyword: nil, reader_batch_size: nil)
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

        Class.new do
          include ::EntityStore

          category category
          entity entity_class
          projection projection_class
          reader reader_class, batch_size: reader_batch_size

          unless snapshot_class.nil?
            if snapshot_interval_keyword.nil?
              snapshot snapshot_class, snapshot_interval
            else
              snapshot snapshot_class, interval: snapshot_interval_keyword
            end
          end
        end
      end

      module Category
        def self.example
          :some_category
        end
      end

      Example = self.example_class
    end
  end
end
