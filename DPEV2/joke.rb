Thread.new(decoy) do |decoy|
  # Fetching joke's website
  fgc = xeat("http://www.jokesclean.com/OneLiner/Random/?Sloom=#{Time.now.to_i}")

  # Checking if the API isn't down!
  if fgc == nil or fgc == false
    return decoy['<'].print(packet({
         'm' => {
             't' => 'Unable to get contents at the moment.',
             'u' => 0
         }
    }))
  end

  # Get the joke
  joke = fgc.split('<p class="c"> <font size="+2">')[1].split('</font></p>')[0].gsub('<p>', '').gsub('</p>', '')
  decoy['<'].print(packet({
      'm' => {
          't' => "Random joke: #{joke}",
          'u' => 0
      }
  }))
end