SCHEDULER.every '30m', first_in: 0 do |job|
  send_event 'next_bus', {
    route_three: NextBus.three,
    route_five: NextBus.five,
    route_ten: NextBus.ten
  }
end
