require 'test_helper'

describe Ruboty::Rsses::Sample do
  it 'starts jobs' do
    Ruboty::Extension::Rss::Job.any_instance.expects(:start)
    # mock_job = mock.tap { |mock| mock.expects(:start) }
    # Ruboty::Extension::Rss::Job.expects(:new).returns(mock_job)

    Ruboty::Robot.new.send(:extension_rss)
  end

  it 'call github method with new entries' do
    mock_entry1 = mock
    mock_entry2 = mock
    Ruboty::Extension::Rss::Checker.any_instance.expects(:new_entries).returns([mock_entry1, mock_entry2])
    Ruboty::Extension::Rss::Job.any_instance.expects(:loop).yields
    Ruboty::Rsses::Sample.any_instance.expects(:github).with(mock_entry1)
    Ruboty::Rsses::Sample.any_instance.expects(:github).with(mock_entry2)

    Ruboty::Robot.new.send(:extension_rss)
  end
end

