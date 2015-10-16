class Collaborator < ActiveRecord::Base
    belongs_to :user
    belongs_to :wiki
    
    def self.update_collaborators(collaborator_string)
        new_collaborators = []
        
    unless collaborator_string.nil? || collaborator_string.empty?
        
        collaborator_string.split(",").each do |p|
            p.strip!
            if User.find_by(email: p)
                user = User.find_by(email: p)
                newCollab = Collaborator.find_or_create_by(user_id: user)
                newCollab.user_id = user.id
                new_collaborators << newCollab
            end
        end
        new_collaborators
    end
end
end
