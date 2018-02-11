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
  lang = args[1] == nil ? 'en' : args[1]
  xatPromo = JSON.parse(fgc)
  chatList = Array.new

  # Check if it has chats.
  if xatPromo[lang] == nil or xatPromo[lang].length == 0
    return decoy['<'].print(packet({
        'm' => {
            't' => 'No chats for this lang.',
            'u' => 0
        }
    }))
  end

  # Fetching normal chats
  xatPromo[lang].each do |key|
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
          't' => 'Promoted chats : ' + (chatList.length > 0 ? chatList.join(', ') : 'None') + '.',
          'u' => 0
      }
  }))
end