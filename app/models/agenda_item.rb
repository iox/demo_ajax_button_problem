class AgendaItem < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    position    :integer, :index => true
    description :string,  :name => true
    timestamps
  end
  attr_accessible :position, :description

  belongs_to :agenda
  has_many   :agenda_subitems, dependent: :destroy
  children   :agenda_subitems

  default_scope do
    order('position asc') 
  end

  def up?
    self.position > 1
  end

  def down?
    agenda = self.agenda
    len = agenda.agenda_items.length
    self.position < len
  end

  def move_up
    if self.position > 1
      target = self.agenda.agenda_items.where(['position = ?',self.position - 1]).first
      target.position = self.position
      self.position = self.position - 1
      self.save!
      target.save!
    end
  end

  def move_down
    count = self.agenda.agenda_items.length
    logger.debug "down count: #{count}"
    if self.position < count
      logger.debug "moving down"
      target = self.agenda.agenda_items.where(['position = ?',self.position + 1]).first
      logger.debug "moving #{self.position} #{target.position}"
      target.position = self.position
      self.position = self.position + 1
      self.save!
      target.save!
      logger.debug "moved #{self.position} #{target.position}"
    end
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
