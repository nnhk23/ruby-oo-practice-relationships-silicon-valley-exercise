class Startup

    attr_accessor :name, :domain, :funds
    attr_reader :founder

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain 
        @name = name
    end

    def self.find_by_founder(founder)
        Startup.all.find{|startup| startup.founder == founder}
    end

    def self.domains
        Startup.all.map{|startup| startup.domain}
    end

    def sign_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount)
    end

    def num_funding_rounds
        FundingRound.all.select{|fr| fr.startup == self}.count
    end

    def total_funds
        FundingRound.all.collect{|fr| 
            if fr.startup == self
                fr.amount
            end
        }.compact.sum
    end

    def investors
        FundingRound.all.collect{|fr|
            if fr.startup == self
                fr.vc
            end
        }.uniq.compact
    end

    def big_investors
        VentureCapitalist.tres_commas_club & self.investors
    end
    
    def self.domains
        @@all.map {|startup| startup.domain}
    end

end
