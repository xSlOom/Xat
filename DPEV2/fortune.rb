Thread.new(decoy) do |decoy|
  # Fetching fortune's website
  fgc = xeat("http://www.fortunecookiemessage.com?Sloom=#{Time.now.to_i}")

  # Checking if the API isn't down!
  if fgc == nil or fgc == false
    return decoy['<'].print(packet({
        'm' => {
            't' => 'Unable to get contents at the moment.',
            'u' => 0
        }
    }))
  end

  # Get the fortune
  fortune = fgc.split('class="cookie-link">')[1].split('</a>')[0].gsub('<p>', '').gsub('</p>', '')
  decoy['<'].print(packet({
      'm' => {
          't' => "(fortunecookie#) Current daily fortune : #{fortune}",
          'u' => 0
      }
  }))
end