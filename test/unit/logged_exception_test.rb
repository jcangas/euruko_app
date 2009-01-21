require File.dirname(__FILE__) + '/../test_helper'

class LoggedExceptionTest < ActiveSupport::TestCase

  def test_email_notification_when_an_exception_is_throwed
    l = LoggedException.new \
            :exception_class => Faker::Name.name,
            :controller_name => Faker::Name.name,
            :action_name     => Faker::Name.name,
            :request         => Faker::Name.name,
            :message         => Faker::Lorem.sentence,
            :backtrace       => Faker::Lorem.sentence
    SystemMailer.expects(:deliver_exception).with(APP_CONFIG['email_exception_recipients'], l)
    l.save
  end
  
end