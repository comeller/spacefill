class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def my_bookings?
    true
  end

  def cancel?
    true
  end

  def approve?
    true
  end

  def decline?
    true
  end
end
