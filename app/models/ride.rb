class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    case
    when nor_tall_nor_tickets_enough!
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}." 
    when not_enough_tickets!
      "Sorry. You do not have enough tickets the #{attraction.name}."
    when not_tall_enough!
      "Sorry. You are not tall enough to ride the #{attraction.name}." 
    else
      update_tickets
      update_nausea
      update_happiness
    end 
  end 

  def not_enough_tickets!
    user.tickets < attraction.tickets
  end

  def not_tall_enough!
    user.height < attraction.min_height
  end

  def nor_tall_nor_tickets_enough! 
    not_enough_tickets! && not_tall_enough!
  end

  def update_tickets
    user.tickets = user.tickets - attraction.tickets
    user.save
  end

  def update_nausea
    user.nausea = user.nausea + attraction.nausea_rating
    user.save
  end

  def update_happiness 
    user.happiness = user.happiness + attraction.happiness_rating
    user.save
  end
end
