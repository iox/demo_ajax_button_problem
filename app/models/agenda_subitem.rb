class AgendaSubitem < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    position    :string,  :index => true
    description :string,  :name => true
    timestamps
  end
  attr_accessible :position, :description

  attr_accessible :description, :position

  belongs_to :agenda_item

  default_scope do
    order('position asc') 
  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
