require_relative '../dictionary'

describe Dictionary do

  it "reads dictionaries"

  it "finds words" do
    @d = Dictionary.new :words => ['foo', 'bar']
    @d.matching_words(['foo']).should == ['foo']
    @d.matching_words(['bar']).should == ['bar']
  end
end
