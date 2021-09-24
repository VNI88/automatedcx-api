# typed: false
# frozen_string_literal: true

RailsAdmin.config do |config|
  require Rails.root.join('lib', 'rails_admin', 'rails_admin_pdf.rb')
  RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::ExportPdf)

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.navigation_static_links = {
    'Routine Details' => ENV['SIDEKIQ_URL'] || 'localhost:3000/sidekiq',
    'Api Docs' => ENV['SWAGGER_URL'] || 'localhost:3000/api-docs',
    'Update your plan!' => '/billing'
  }
  config.parent_controller = 'ApplicationController'

  config.actions do
    dashboard
    index # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    export_pdf do
      except User
    end

    charts
    ## With an audit adapter, you can add:
    history_index
    history_show
  end
end
