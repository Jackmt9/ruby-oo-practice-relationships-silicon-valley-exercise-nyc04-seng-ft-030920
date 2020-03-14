class Startup
    attr_accessor :name, :domain
    attr_reader :founder
    ALL = []
    DOMAINS = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        ALL << self
        @domain = domain
        DOMAINS << @domain
    end

    def pivot(new_name, new_domain)
        @name = new_name
        @domain = new_domain
    end

    def self.all
        ALL
    end

    def self.find_by_founder(founder)
        founder_instance = ALL.select do |instance|
            instance.founder == founder
        end
        founder_instance[0].name
    end

    def self.domains
        DOMAINS
    end

    def sign_contract(venture_cap, new_funding_round, amount)
        FundingRound.new(self, venture_cap, new_funding_round, amount)
    end

    # helper
    def find_investors_in_company
        instance_funded = FundingRound.all.select do |funding_instance|
            funding_instance.startup.name == @name
        end
    end

    def num_funding_rounds
        find_investors_in_company.length
    end

    def total_funds
        count = 0.0
        find_investors_in_company.each do |instance_funded|
            count += instance_funded.investment
        end
        count
    end

    def investors
        venture_caps = find_investors_in_company.map do |instance|
            instance.venture_cap.name
        end
        venture_caps.uniq
    end

    def big_investors
        tres_investors = find_investors_in_company.select do |instance_funded|
            VentureCapitalist.tres_commas_club.include?(instance_funded.venture_cap.name)
        end
        investors = tres_investors.map do |investor_instance|
            investor_instance.venture_cap.name
        end
        investors
    end
end
