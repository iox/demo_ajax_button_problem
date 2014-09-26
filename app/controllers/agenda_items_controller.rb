class AgendaItemsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

	auto_actions_for :agenda, [ :index, :new, :create ]
	
  include TablePlusIndex

  def index_for_agenda
    logger.debug "index-for-agenda"
  	table_plus_index( self, 6,
  										[:description],
  										nil,
  										:position, :description )
  end

  def up
    logger.debug "agenda_item up, #{params.inspect}"
    agenda_item = AgendaItem.find(params[:id])
    agenda_item.move_up
    @this = agenda_item.agenda
    # redirect_to agenda_path(agenda_item.agenda)
  end

  def down
    logger.debug "agenda_item down, #{params.inspect}"
    agenda_item = AgendaItem.find(params[:id])
    agenda_item.move_down
    @this = agenda_item.agenda
    # redirect_to :back # temporary
  end
end
