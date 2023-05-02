class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    # def companies
    #     #returns array of companies
    #     #checks freebies array
    #     #checks for self.id==freebie.dev_id
    #     company_array=[]

    #     for freebie in Freebie.all do
    #         if self.id==freebie.dev_id
    #             comp=Company.find(freebie.company_id)
    #             company_array << comp
    #         end
    #     end
    #     company_array
    # end

    def recieved_one?(item)

        #returns true or false
        #gathers all freebies associated with certain Dev
        #
        recieved_array=[]

        for freebie in Freebie.all do
            if self.id==freebie.dev_id
                recieved_array << freebie.item_name
            end
            
        end
        recieved_array.include?(item)
    end

    def give_away(dev,freebie)
        #turn freebie's dev into inputted dev
        if freebie.dev_id==self.id
        a=freebie
        a.dev_id=dev.id
        a.save
        else
        "That isn't yours"
        end

    end

end
