require 'twilio-ruby'
class TwilioController < ApplicationController
  # include Webhookable

  # after_filter :set_headerteams

  skip_before_action :verify_authenticity_token

  def home
  end
end
