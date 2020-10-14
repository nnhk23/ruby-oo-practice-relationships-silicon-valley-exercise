class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.tres_commas_club
        VentureCapitalist.all.select{|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(su, type, amount)
        fund_round = FundingRound.new(su, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select{|fr| fr.vc == self}
    end

    def portfolio
        FundingRound.all.collect{|fr| 
            if fr.vc == self
                fr.startup
            end
        }.uniq.compact
    end


    def invested(domain)
        funding_rounds.reduce(0) {|memo, funding_round|
            if funding_round.startup.domain == domain
                memo += funding_round.amount
            end
            memo
        }
    end

end
