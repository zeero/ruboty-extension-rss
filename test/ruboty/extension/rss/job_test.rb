require 'test_helper'

describe Ruboty::Extension::Rss::Job do
  subject { Ruboty::Extension::Rss::Job.new(mock_rss, 'url', rss_method, interval: 1) }

  let(:mock_rss) { mock }
  let(:rss_method) { 'name' }
  let(:mock_checker) { mock }

  before do
    Ruboty::Extension::Rss::Checker.stubs(:new).returns mock_checker
  end

  describe '#check' do
    it 'returns empty array with no new entries' do
      mock_checker.expects(:new_entries).returns([])

      subject.send(:check).must_equal []
    end

    it 'calls rss method with some new entries' do
      entry1 = mock
      entry2 = mock
      mock_rss.expects(rss_method.to_sym).with(entry1)
      mock_rss.expects(rss_method.to_sym).with(entry2)
      mock_checker.expects(:new_entries).returns([entry1, entry2])

      subject.send(:check).must_equal [entry1, entry2]
    end
  end

  describe '#run' do
    it 'loops run' do
      subject.expects(:sleep).with(1)
      subject.expects(:check).with
      subject.expects(:loop).yields

      subject.send(:run)
    end
  end

  describe '#start' do
    it 'starts thread run' do
      subject.expects(:run).with

      t = subject.start
      t.join
    end
  end
end

