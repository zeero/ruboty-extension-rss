require 'test_helper'

describe Ruboty::Extension::RSS do
  subject { Ruboty::Extension::RSS }

  describe 'VERSION' do
    it 'has a version number' do
      ::Ruboty::Extension::RSS::VERSION.wont_be_nil
    end
  end

  describe '.to_positive_i' do
    it 'returns positive integer with positive number' do
      subject.to_positive_i('10.99').must_equal 10
      subject.to_positive_i(10.99).must_equal 10
    end

    it 'returns nil with non-numeric' do
      subject.to_positive_i('a').must_be_nil
      subject.to_positive_i('').must_be_nil
      subject.to_positive_i(nil).must_be_nil
    end

    it 'returns nil with negative number' do
      subject.to_positive_i('-1').must_be_nil
      subject.to_positive_i(-1).must_be_nil
    end

    it 'returns nil with zero' do
      subject.to_positive_i('0').must_be_nil
      subject.to_positive_i(0).must_be_nil
    end
  end
end
