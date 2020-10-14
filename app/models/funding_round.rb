class FundingRound

    attr_reader :startup, :vc
    attr_accessor :type, :amount

    @@all = []

    def self.all
        @@all
    end

    def initialize(startup, vc, type, amount)
        @startup = startup
        @vc = vc 
        @type = type
        @amount = amount
        @@all << self
    end

end
