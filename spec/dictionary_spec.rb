require_relative '../dictionary'

describe Dictionary do

  it "finds words" do
    @d = Dictionary.new ['foo', 'bar']
    @d.matching_words(['foo']).should == ['foo']
    @d.matching_words(['bar']).should == ['bar']
  end

  it "reads from dictionary files" do
    @d = Dictionary.new 'spec/fixtures/test_dictionary'
    @d.dict.should be_kind_of Array
    @d.dict.should_not be_empty
    @d.dict.should == ["baz", "bar", "hello", "world"]
  end

  it "raises exception if source isn't valid" do
    expect { @d = Dictionary.new 'notavalidfileorarray' }.to raise_error
  end

end

