require "test_helper"
require 'sidekiq/scheduled'

class SendMessageJobTest < ActiveJob::TestCase
  test 'should perform a job' do
    assert_performed_jobs 1 do
      SendMessageJob.perform_later(1, { user_id: 1, room_id: 1, content: 'test content' })
    end
  end

  test 'should perform a job with expected result' do
    assert_performed_with(job: SendMessageJob, args: [1, { user_id: 1, room_id: 1, content: 'test content' }]) do
      SendMessageJob.perform_later(1, { user_id: 1, room_id: 1, content: 'test content' })
    end
  end
end
