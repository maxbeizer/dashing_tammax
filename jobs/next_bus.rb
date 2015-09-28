SCHEDULER.every '20m', first_in: 0 do |job|
  send_event 'next_bus', {
    nolensville_and_thompson: NextBus.nolensville_and_thompson
  }
end
