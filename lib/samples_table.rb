module SamplesTable
  class Table < Array
    alias :each_sample :each

    def initialize(*values)
      @header = values.shift
      values.each do |sample_values|
        self.<< sample_values
      end
    end

    def <<(sample_values)
      super(Sample.new(@header, sample_values))
    end

  end
  
  class Sample
    def initialize(keys, sample_values)
      @sample_properties = Hash.new
      keys.each do |key|
        @sample_properties[key] = sample_values.shift
      end
    end
    def method_missing(m, *args, &block)  
      @sample_properties[m]
    end
  end

end
