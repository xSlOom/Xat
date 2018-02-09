Thread.new(decoy) do |decoy|
  # Fetching fml's website
  fgc = xeat("http://www.fmylife.com/random?Sloom=#{Time.now.to_i}")

  # Checking if it's not down
  if fgc == false or fgc == nil
    return decoy['<'].print(packet({
         'm' => {
             't' => 'Unable to read fml\'s website.',
             'u' => 0
         }
     }))
  end

  # Getting the fml thing!
  fml = fgc.split('class="block hidden-xs">')[1].split('<a href')[1].split('.html')[1].split('</a>')[0].gsub!(/[^A-Za-z .]/, '')
  decoy['<'].print(packet({
      'm' => {
          't' => fml,
          'u' => 0
      }
  }))
end