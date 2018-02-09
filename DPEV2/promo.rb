Thread.new(decoy) do |decoy|
  # Get promo data
  fgc = xeat("https://xat.com/json/promo.php?Sloom=#{Time.now.to_i}")

  # Checking if xat is down or not
  if fgc == false or fgc == nil
    return decoy['<'].print(packet({
         'm' => {
             't' => 'Unable to get the promo page at the moment.',
             'u' => 0
         }
     }))
  end

  # Collecting the english chats
  xatPromo = JSON.parse(fgc)
  chatList = Array.new

  # Fetching normal chats
  xatPromo['en'].each do |key|
    if key['t'] != nil
      seconds = key['t'] - Time.now.to_i
      timeSeconds = seconds.to_i > 0 ? "[#{seconds.to_i} seconds left]" : ''
      chatList.push("#{key['n']} #{timeSeconds}")
    else
      chatList.push("#{key['n']}")
    end
  end

  decoy['<'].print(packet({
      'm' => {
          't' => 'English promoted chats : ' + (chatList.length > 0 ? chatList.join(', ') : 'None') + '.',
          'u' => 0
      }
  }))
end

