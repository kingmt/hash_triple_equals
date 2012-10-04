require 'hash_triple_equals'

describe Hash do
  context '===' do
    context 'simple matches' do
      before :each do
        @base = {:elem1 => false, :elem2 => 12, :elem3 => 'test_value1'}
      end

      it {(@base==={:elem1 => false, :elem2 => 12, :elem3 => 'test_value1'}).should be_true}
      it {(@base==={:elem1 => true, :elem2 => 12, :elem3 => 'test_value'}).should be_false}
      it {(@base==={:elem1 => true, :elem3 => 'test_value'              }).should be_false}
    end

    context 'range matches' do
      before :each do
        @base = {:elem1 => true,  :elem2 => 12, :elem3 => 4..1000}
      end

      it {(@base==={:elem1 => true, :elem2 => 12, :elem3 => 5}).should be_true}
      it {(@base==={:elem1 => true, :elem2 => 12, :elem3 => 2}).should be_false}
      it {(@base==={:elem1 => true, :elem2 => 12, :elem4 => 2}).should be_false}
    end

    context 'nil matches' do
      before :each do
        @base = {:elem1 => true,  :elem2 => 15, :elem3 => nil}
      end

      it {(@base==={:elem1 => true, :elem2 => 15, :elem3 => 5       }).should be_true}
      it {(@base==={:elem1 => true, :elem2 => 15, :elem3 => :symbol }).should be_true}
      it {(@base==={:elem1 => true, :elem2 => 15, :elem3 => 'string'}).should be_true}
    end

    context 'array matches' do
      before :each do
        @base = {:elem1 => true,  :elem2 => 15, :elem3 => ['a', 'b']}
      end

      it {(@base==={:elem1 => true, :elem2 => 15, :elem3 => 'a'}).should be_true}
    end

  end
end
