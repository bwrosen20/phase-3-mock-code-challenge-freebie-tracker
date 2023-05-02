require "pry"
class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    # def devs

    #     #returns list of devs
    #     #add to array if dev collected a freebie from company
    #     #Check if 
    #     dev_array=[]
    #     for freebie in Freebie.all do
    #         if freebie.company_id==self.id
    #             the_dev=Dev.find(freebie.dev_id)
    #             dev_array << the_dev.name
    #         end
    #     end
    #     dev_array
    # end

    def give_freebie(dev:, item_name:, value:)
        Freebie.create(company_id: self.id, dev_id:Dev.find_by_name(dev).id, item_name: item_name, value: value)
    end

    def self.oldest_company
        Company.all.order(:founding_year).first
    end

end
