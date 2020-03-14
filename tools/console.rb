require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# Tests for startup.rb
twitter = Startup.new("Twitter", "Jack", "twitter.com")
facebook = Startup.new("Facebook", "Xavier", "facebook.com")
instagram = Startup.new("Instagram", "John", "instagram.com")
twitter.pivot("Not Twitter", "nottwitter.com")
Startup.find_by_founder("Jack")

# Tests for venture_capitalist.rb
jason = VentureCapitalist.new("Jason", 5)
jane = VentureCapitalist.new("Jane", 1_000_000_001)
richard = VentureCapitalist.new("Richard", 8_000_000_001)
VentureCapitalist.tres_commas_club

# Tests for funding_round.rb
twitter_funding = FundingRound.new(twitter, jason, "Round A", 1_000_001)
facebook_funding = FundingRound.new(facebook, jane, "Series B", 150)
instagram_funding = FundingRound.new(instagram, jason, "Beta", 5_000)

# additional tests

# startup.rb
twitter.sign_contract(jason, "Round B", 5_000_000.0)
twitter.sign_contract(jason, "Round Lambda", 3_000.0)
facebook.sign_contract(jason, "Round A", 3_000.0)
twitter.sign_contract(jane, "Round C", 3_000_000.0)
twitter.sign_contract(richard, "Round C", 1_000.0)
twitter.num_funding_rounds
twitter.total_funds
twitter.investors
twitter.big_investors

# venture_capitalist.rb
jason.offer_contract(twitter, "Round D", 400.0)
jason.funding_rounds
jason.portfolio
jason.biggest_investment
jason.invested("nottwitter.com")

binding.pry
#leave this here to ensure binding.pry isn't the last line