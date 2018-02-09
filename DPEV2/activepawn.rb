Thread.new(decoy) do |decoy|
	pawns	= Array.new
  	fgc = xeat("https://xat.com/web_gear/chat/pow2.php?Sloom=#{Time.now.getutc}")

  	if fgc == false
		return decoy['<'].print(packet({
	    	'm' => {
				't' => 'Unable to read pow2 at the moment.',
				'u' => 0
			}
    	}))
  	end

	pow2 = JSON.parse(fgc)

	pow2[7][1].each do |i,c|
		if i != 'time' and i != '!'
			pawns.push("hat#h#{i}")
		end
	end

	newpawn	= pawns.join(', ')
  	return decoy['<'].print(packet({
      'm' => {
          't' => "#{pawns.length} actives pawns : #{newpawn}",
          'u' => 0
      }
  }))
end
