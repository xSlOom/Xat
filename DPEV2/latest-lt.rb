Thread.new(decoy) do |decoy|
  	# Get API informations
    fgc = xeat("https://api.illuxat.com/latestpower.php?Sloom=#{Time.now.getutc}")
    # Checking if the api isn't down
    if fgc == false
      return decoy['<'].print(packet({
          'm' => {
              't' => 'Unable to read Illuxat at the moment.',
              'u' => 0
          }
      }))
    end
    # Get the JSON and save data in an array
		parseJson = JSON.parse(fgc)
    newData = [
        'ID' => parseJson['latest']['ID'].to_i,
        'name' => parseJson['latest']['Name'].downcase.capitalize,
        'status' => parseJson['latest']['Status'].upcase,
        'topsh' => parseJson['latest']['Smileys'].gsub(',', ', '),
        'pawns' => parseJson['latest']['Pawns'].gsub(',', ', '),
        'price' => parseJson['latest']['XatStore'],
        'hug' => parseJson['latest']['hug']
    ]
    # display the message
    if newData[0]['name'] == ''
      return decoy['<'].print(packet({
          'm' => {
            't' => 'An error occured on pow2.. The name is not added/updated yet.',
            'u' => 0
          }
      }))
    end
    xatMessage = "#{newData[0]['name']}(ID: #{newData[0]['ID']}): "
    xatMessage += 'Pawns : ' + newData[0]['pawns'] + ' | Smilies : ' + newData[0]['topsh']
    # Checking for hug....
    if newData[0]['hug'] != false
      xatMessage += ' | Hug : ' + newData[0]['hug']
    end
    # Settings up the price and status!
    xatMessage +=  ' | Store price : ' + newData[0]['price'] + ' | Status : ' + newData[0]['status']
    # Checking for countdown ...
    if parseJson['ptime']['time'] != nil
      timestamp = parseJson['ptime']['time'].to_i - Time.now.to_i
      maxPerUser = parseJson['ptime']['max'] == nil ? 'Unknown' : parseJson['ptime']['max'].to_i
      # Calculate the time
      hours = (timestamp / 3600)
      minute = ((timestamp / 60) % 60)
      second = (timestamp % 60)
      releaseMessage = timestamp >= 0 ? "in #{hours} hours, #{minute} minutes and #{second} seconds" : ': Released in store'
      xatMessage += " | Release #{releaseMessage} | Max per user: #{maxPerUser}"
    end

    decoy['<'].print(packet({
        'm' => {
            't' => xatMessage,
            'u' => 0
        }
    }))
end