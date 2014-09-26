class AgendaSubitemsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  auto_actions_for :agenda_item, [ :index, :new, :create ]
	
  include TablePlusIndex

  # def index
  # 	table_plus_index( self, 6,
  # 										[:description],
  # 										nil,
  # 										:position, :description )
  # end

end
