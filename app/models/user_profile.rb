class UserProfile < ApplicationRecord
    belongs_to :user


    def full_name
        "#{self.l_name}, #{self.f_name}"
    end

    def status
        # byebug
        if self.user.type == :student || :unassigned
            return self.user.program ? 'Enrolled' : 'Pending'
        else
            return nil
        end
    end
end
