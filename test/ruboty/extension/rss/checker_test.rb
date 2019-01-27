require 'test_helper'

describe Ruboty::Extension::Rss::Checker do
  subject { Ruboty::Extension::Rss::Checker }

  let(:mock_item1) { mock.tap { |mock| mock.stubs(:link).returns('url1') } }
  let(:mock_item2) { mock.tap { |mock| mock.stubs(:link).returns('url2') } }
  let(:mock_item3) { mock.tap { |mock| mock.stubs(:link).returns('url3') } }
  let(:mock_feed1) { mock.tap { |mock| mock.expects(:entries).returns([mock_item1]) } }
  let(:mock_feed2) { mock.tap { |mock| mock.expects(:entries).returns([mock_item2, mock_item1]) } }
  let(:mock_feed3) { mock.tap { |mock| mock.expects(:entries).returns([mock_item3, mock_item2, mock_item1]) } }

  before do
  end

  describe '#new_entries' do
    it 'should return new entries' do
      Ruboty::Extension::Rss::Feed.expects(:new).returns(mock_feed1)
      checker = subject.new('')

      Ruboty::Extension::Rss::Feed.expects(:new).returns(mock_feed3)
      checker.new_entries.must_equal [mock_item3, mock_item2]
    end

    it 'should return new entries everytime' do
      Ruboty::Extension::Rss::Feed.expects(:new).returns(mock_feed1)
      checker = subject.new('')

      Ruboty::Extension::Rss::Feed.expects(:new).returns(mock_feed2)
      checker.new_entries.must_equal [mock_item2]

      Ruboty::Extension::Rss::Feed.expects(:new).returns(mock_feed3)
      checker.new_entries.must_equal [mock_item3]
    end
  end
end

