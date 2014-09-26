class Agenda < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name         :string
    meeting_date :date
    meeting_type  enum_string('Business', 'Board of Directors'), :default => "Business"
    timestamps
  end
  attr_accessible :meeting_date, :meeting_type

    validates_presence_of :meeting_date

  has_many  :agenda_items, dependent: :destroy
  children  :agenda_items

  before_save do |agenda|
    agenda.name = agenda.meeting_type + ' Meeting of ' + meeting_date.to_s
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
