require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

el = Startup.new("El", "A", "AC")
kim = Startup.new("Kim", "A", "B")
anna = Startup.new("Anna", "E", "D")

v1 = VentureCapitalist.new("Vincent", 1000000540)
v2 = VentureCapitalist.new("Andrew", 250000000000)
v3 = VentureCapitalist.new("Eric", 400)

f1 = FundingRound.new(el, v1, "Seed", 1000)
f2 = FundingRound.new(kim, v2, "Pre-Seed", 5000)
# f3 = FundingRound.new(anna, v1, "Series A", 900)

el.sign_contract(v1, "Seed", 1000000)
kim.sign_contract(v2, "Seed", 1000000)

v1.offer_contract(anna, "Seed", 500000)
v2.offer_contract(kim, "Pre-Seed", 1000000001)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line