# -*- encoding : utf-8 -*-

require 'mongoid/userstamps/version'
require 'mongoid/userstamps/config'
require 'mongoid/userstamps/user'
require 'mongoid/userstamps/model'
require 'mongoid/userstamps/created'
require 'mongoid/userstamps/updated'
require 'mongoid/userstamps/deleted'
require 'mongoid/Userstamps/railtie' if defined? Rails

module Mongoid
  module Userstamps
    extend ActiveSupport::Concern

    include Created
    include Updated

    included do
      if defined?(Mongoid::Paranoia) && self < Mongoid::Paranoia
        include Deleted
      end
    end
  end
end

