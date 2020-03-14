class VentureCapitalist
    attr_accessor :name, :worth
    NAMES = []
    def initialize(name, worth)
        @name = name
        @worth = worth
        NAMES << self
    end

    def self.all
        NAMES
    end

    def self.tres_commas_club
        tres_instances = NAMES.select do |name|
            name.worth > 1_000_000_000
        end
        tres_instances.map! do |instance|
            instance.name
        end
        tres_instances
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def find_by_capitalist
        cap_investments = FundingRound.all.select do |funding_round|
            funding_round.venture_cap.name.include?(@name)
        end
        cap_investments
    end

    def funding_rounds
        find_by_capitalist.map do |fund_inst|
            fund_inst.type
        end
    end

    def portfolio
        names_funded_by_cap = find_by_capitalist.map do |fund_inst|
            fund_inst.startup.name
        end
        names_funded_by_cap.uniq
    end

    def biggest_investment
        largest_investment = 0
        corresp_funding_round = ""
        find_by_capitalist.each do |fund_inst|
            if fund_inst.investment > largest_investment
                corresp_funding_round = fund_inst
                largest_investment = fund_inst.investment
            end
        end
        corresp_funding_round
    end

    def invested(domain)
        funded_domain = find_by_capitalist.select do |fund_inst|
            fund_inst.startup.domain == domain
        end
        funded_domain
    end

end
