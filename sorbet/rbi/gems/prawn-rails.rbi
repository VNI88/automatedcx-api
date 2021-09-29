# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/prawn-rails/all/prawn-rails.rbi
#
# prawn-rails-1.3.0

module PrawnRails
  def config; end
  extend PrawnRails
end
class PrawnRails::Document < Prawn::Document
  def initialize(options = nil); end
  def self.extensions; end
  def text(value, options = nil); end
end
module PrawnRails::RailsHelper
  def get_metadata; end
  def prawn_document(options = nil); end
end
class PrawnRails::Renderer
  def self.call(template, source = nil); end
end
class PrawnRails::Engine < Rails::Engine
end
class ActionView::Base
  include PrawnRails::RailsHelper
end
