require 'test_helper'

describe Ruboty::Rsses::Sample do
  it 'starts jobs' do
    Ruboty::Extension::Rss::Job.any_instance.expects(:start)

    Ruboty::Robot.new.send(:extension_rss)
  end

  it 'run jobs on thread' do
    Ruboty::Extension::Rss::Job.any_instance.expects(:run)

    threads = Ruboty::Robot.new.send(:extension_rss)
    threads.flatten.each(&:join)
  end

  it 'call github method with new entries' do
    mock_entry1 = mock.tap { |mock| mock.expects(:link).returns('mock_entry1').twice }
    mock_entry2 = mock.tap { |mock| mock.expects(:link).returns('mock_entry2').twice }
    Ruboty::Extension::Rss::Feed.any_instance.expects(:entries).returns([mock_entry1, mock_entry2])
    Ruboty::Extension::Rss::Job.any_instance.expects(:loop).yields
    Ruboty::Rsses::Sample.any_instance.expects(:github).with(mock_entry1)
    Ruboty::Rsses::Sample.any_instance.expects(:github).with(mock_entry2)

    threads = Ruboty::Robot.new.send(:extension_rss)
    threads.flatten.each(&:join)
  end
end

