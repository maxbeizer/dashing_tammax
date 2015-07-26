SCHEDULER.every '20m', first_in: 0 do |job|
  send_event 'next_bus', {
    west_end: NextBus.west_end,
    charlotte: NextBus.charlotte
  }
end
