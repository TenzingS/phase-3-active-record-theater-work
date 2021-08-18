class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map { |audition| audition.actor }
    end

    def locations
        self.auditions.map { |audition| audience.location }
    end

    def lead
        if (self.auditions.find_by(hired: true))
            return self.auditions.find_by(hired: true)
        else
            return "no actor has been hired for this role"
        end
    end

    def understudy
        if (self.auditions.where(hired: true).second)
            return self.auditions.where(hired: true).second
        else
            return "no actor has been hired for this role"
        end
    end
end