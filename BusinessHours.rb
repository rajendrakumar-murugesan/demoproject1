class BusinessHours

  def initialize(start, finish)
    calendar = Struct.new(:start, :finish, :closed, :updated)
    @calendar = calendar.new(start, finish)
  end

  def show2
    p @calender.start, @calender.finish
  end
  def self.show
    print "class hours"
  end
end

bh = BusinessHours.new("9:00 AM", "3:00 PM")
bh.show2()
