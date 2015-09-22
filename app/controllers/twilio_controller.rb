require 'twilio-ruby'
class TwilioController < ApplicationController
  # include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  # Twilio::SmsWorker.perform_in(1.minute, '8018242592', "This is some text message")
end
