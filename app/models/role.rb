class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.collect do |a|
            a.actor
        end
    end

    def locations
        self.auditions.collect do |a|
            a.location
        end
    end

    def lead
        if self.auditions.find_by(hired: true)
            self.auditions.find_by(hired: true).first
        else
            'no actor has been hired for this role'
        end
    end

    def understudy
        if self.auditions.find_by(hired: true)
            self.auditions.find_by(hired: true).second
        else
            'no actor has been hired for this role'
        end
    end
end