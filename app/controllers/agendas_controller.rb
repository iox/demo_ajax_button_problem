class AgendasController < ApplicationController

  hobo_model_controller

  auto_actions :all

  include TablePlusIndex

  def index
  	table_plus_index( self, 
  										6,
  										[:name],
  										nil,
  										:name )
  end

  def show
    logger.debug "Agenda Show #{params.inspect}"
    hobo_show
  end

end
