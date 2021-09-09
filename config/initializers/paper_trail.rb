# frozen_string_literal: true

module PaperTrail
  module Rails
    # class responsible for loading PaperTrail
    class Engine < ::Rails::Engine
      paths['app/models'] << 'lib/paper_trail/frameworks/active_record/models'
    end
  end
end

PaperTrail.config.enabled = true
PaperTrail.config.has_paper_trail_defaults = {
  on: %i[create update destroy]
}
PaperTrail.config.version_limit = 3
