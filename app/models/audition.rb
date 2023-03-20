class Audition < ActiveRecord::Base
    belongs_to :role

    def role
        self.role_id
    end

    def call_back
        self.hired = true
    end
  
end