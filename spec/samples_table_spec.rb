require 'rspec'
require 'samples_table'

describe SamplesTable do

  subject do
    SamplesTable::Table.new [:valor_teste , :nenhum_valor , :algo_legal , :esqueceram_de_mim ],
                     [      66     ,      10       ,      20     ,          66        ],
                     [      15     ,      30       ,      20     ,          30        ]
  end

  let(:first_sample){subject[0]}
  let(:second_sample){subject[1]}

  it {first_sample.valor_teste.should eql 66}
  it {first_sample.nenhum_valor.should eql 10}
  it {first_sample.algo_legal.should eql 20}
  it {first_sample.esqueceram_de_mim.should eql 66}

  it {second_sample.valor_teste.should eql 15}
  it {second_sample.nenhum_valor.should eql 30}
  it {second_sample.algo_legal.should eql 20}
  it {second_sample.esqueceram_de_mim.should eql 30}

  it {subject.size.should eql 2}

  it {subject.should be_a_kind_of(Array)}

  it {subject.should respond_to(:each_sample)}

end