class Contact < ActiveRecord::Base
    has_many :email_addresses
    has_many :phones
    
    def check_contact_name
        @name = ""
        if (first_name.nil? == false)
            if (last_name.nil? == false)
                name = first_name + ' ' + last_name
            else
                name = first_name
            end
        end
            
        if (chinese_first_name.nil? == false)
            if (@name.nil? == false)
                if (nick_name.nil? == false)
                    name = name + '(' + chinese_last_name +  chinese_first_name + ',' + nick_name + ')'
                else
                    name = name + '(' + chinese_last_name +  chinese_first_name + ')'
                end
            end
        else
            if (nick_name.nil? == false)
                if (@name.nil? == false)
                    name = name + '(' + nick_name + ')'
                else
                    name = nick_name
                end
            end
        end
        
        if (@name.nil? == true)
            name = 'N/A'
        end
            
        return name
    end
end
