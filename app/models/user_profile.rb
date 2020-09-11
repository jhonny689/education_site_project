class UserProfile < ApplicationRecord
    belongs_to :user


    def full_name
        "#{self.l_name}, #{self.f_name}"
    end

    def status

        if self.user.type == :student || self.user.type == :unassigned
            if self.user.type == :student
                return self.user.enrolled_program ? 'Enrolled' : 'Pending'
            else
                return 'Pending'
            end
        else
            return nil
        end
    end
end
