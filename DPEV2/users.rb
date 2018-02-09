Thread.new(decoy) do |decoy|
  # Checking the total users on the chat
  totalUser = Thread.main['au'][decoy['room']]
  return decoy['<'].print(packet({
      'm' => {
          't' => "There are #{totalUser.length + 1} users on this chat.",
          'u' => 0
      }
  }))
end