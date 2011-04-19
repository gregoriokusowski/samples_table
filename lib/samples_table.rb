# Copyright (c) 2011 Gregório Chalinski Kusowski
# https://github.com/gregoriokusowski/samples_table
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# samples_table is a gem that helps the writing of spec cases.
# Based on cucumber's tables, it can be used without dependencies.
#
# How to configure(with RSpec):
# # spec_helper.rb
# RSpec.configure do |config|
#   #your old config here
#   config.extend SamplesTable, :type => :model
# end
# 
# How to use:
# require 'spec_helper'
# describe Sale do
#   describe "selling fruits" do
#     (samples [ :fruit , :quantity , :total ],
#              [ :apple ,     1     ,   1.0  ],
#              [ :apple ,     2     ,   2.0  ],
#              [ :apple ,    10     ,   9.5  ],#should apply discount when sells 10+
#              [ :orange,     1     ,   2.0  ],
#              [ :orange,     2     ,   4.0  ],
#              [ :orange,    10     ,  19.0  ]).each_sample do |sample|
#       describe "when selling #{sample.fruit}" do
#         before{subject.fruit = sample.fruit}
#         describe "and the customer wants to buy #{sample.quantity}" do
#           before{subject.quantity = sample.quantity}
#           it "should totalize #{sample.total} bucks" do
#             subject.total.should eql sample.total
#           end
#         end
#       end
#     end
#   end
# end
# 
module SamplesTable

  def samples(*args)
    Table.new(*args)
  end

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
