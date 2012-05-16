class Review < ActiveRecord::Base
has_many :review_photos, :dependent => :destroy
  
  
validates :terms, :acceptance => {:accept => true}
validates :organization_id, :presence => true
validates :program_id, :presence => true
validates_length_of :body, :minimum => 200, :message => "Must contain at least 30 
characters."
validates_length_of :body, :maximum => 10000, :message => "You have entered more than 10,000 characters"
belongs_to :program
belongs_to :user



attr_accessible :user_id, :program_id, :body, :rating, :photo, :show, :organization_id, :time_frame, :before, :terms, :preparation, :support, :impact, :structure, :overall

# Paperclip
mount_uploader :photo, ImageUploader
		
		
    def roundup(overall)
        (overall*2).round / 2.0
    end

end
