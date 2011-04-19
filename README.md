samples_table is a gem that helps the job of writing tests and specs.
Based on cucumber's tables, you can create simple test cases easily.
Since it 'embed' the table into ruby code, it avoids the need of configurations, and/or the creation and use of third test files for the examples.

***
### Default Configuration:

	# Gemfile (you may just need to add the samples table line)
	group :development, :test do
	  gem 'samples_table'
	end

***
### Configuration(with RSpec):

	# spec_helper.rb
	RSpec.configure do |config|
		#your old config here
		config.extend SamplesTable, :type => :model
	end

***
### Example(with RSpec):

	#sale_spec.rb
	require 'spec_helper'
	describe Sale do
	  describe "selling fruits" do
	    (samples [ :fruit , :quantity , :total ],
	             [ :apple ,     1     ,   1.0  ],
	             [ :apple ,     2     ,   2.0  ],
	             [ :apple ,    10     ,   9.5  ],#should apply discount when sells 10+
	             [ :orange,     1     ,   2.0  ],
	             [ :orange,     2     ,   4.0  ],
	             [ :orange,    10     ,  19.0  ]).each_sample do |sample|
	      describe "when selling #{sample.fruit}" do
	        before{subject.fruit = sample.fruit}
	        describe "and the customer wants to buy #{sample.quantity}" do
	          before{subject.quantity = sample.quantity}
	          it "should totalize #{sample.total} bucks" do
	            subject.total.should eql sample.total
	          end
	        end
	      end
	    end
	  end
	end

***
Feel free to 

***
### License:
__samples_table__ is released under the MIT license.