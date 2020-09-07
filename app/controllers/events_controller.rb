# frozen_string_literal: true

class EventsController < ApplicationController
  prepend_before_action -> { warden.authenticate!(:api_key) }
  before_action :validate_event_creation_params, only: :create
  before_action :validate_event_params, only: %i[show update destroy]

  def create
    begin
      Event.create!(
        user_id: current_user.id,
        name: params[:name],
        category: params[:category],
        metadata: params[:metadata],
        previous_event_name: params[:previous_event_name],
        next_event_name: params[:next_event_name]
      )
    rescue StandardError => error
      Raven.capture_exception(error)
    end
  end

  def index
    Event.based_on_company_name(current_user.company_name)
  end

  def show
    Event.find_by(id: params[:id])
  end

  def update
    Event.find_by(id: params[:id])
         .update!(
            name: params[:name],
            category: params[:category],
            previous_event_name: params[:previous_event_name],
            next_event_name: params[:next_event_name],
            metadata: params[:metadata],
            started_at: params[:started_at],
            finished_at: params[:finished_at]
         )
  end

  def destroy
    Event.destroy!(params[:id])
  end

  private

  def validate_event_creation_params
    params.require(%i[name category])
    params.permit(:previous_event_name, :next_event_name, :metadata, :started_at, :finished_at)
  end

  def validate_event_params
    params.require(:id)
    params.permit(:name, :category, :previous_event_name, :next_event_name, :metadata, :started_at, :finished_at)
  end
end
