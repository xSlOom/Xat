Thread.new(decoy) do |decoy|
  # Checking if we have an argument
  if args[1] == '' or args[1] == nil
    return decoy['<'].print(packet({
        'm' => {
          't' => 'Usage: //8ball [question] (E.g : //8ball am I good)',
          'u' => 0
        }
    }))
  end

  # Checking for a not valid question
  args[1] = args[1].downcase
  if args[1] == 'who' or args[1] == 'what' or args[1] == 'why'
    return decoy['<'].print(packet({
        'm' => {
          't' => 'This is not a yes/no question!',
          'u' => 0
        }
     }))
  end

  # Answering you..
  eightball = [
      "My reply is no",
      "You must be joking",
      "My sources say no",
      "Very doubtful",
      "Don't count on it",
      "Outlook not so good",
      "Better not tell you now",
      "Cannot predict now",
      "Reply hazy, try again",
      "Focus and ask again",
      "It is certain",
      "It is decidedly so",
      "Most likely",
      "As I see it, yes",
      "Outlook good",
      "Signs point to yes",
      "Without a doubt",
      "Yes", "Yes - definitely",
      "You may rely on it",
      "42 says it is so",
      "You got it",
      "Spot on",
      "Bang on",
      "Perfectly right",
      "Absolutely",
      "It's a safe bet",
      "affirmative",
      "Beyond a doubt",
      "Certainly",
      "Definitely",
      "Positively",
      "It's a sure thing"
  ]

  randomAnswer = eightball.sample
  args[0] = nil
  decoy['<'].print(packet({
      'm' => {
        't' => "(8ball#)#{args.join(' ')} : #{randomAnswer}",
        'u' => 0
      }
  }))
end