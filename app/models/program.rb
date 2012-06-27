class Program < ActiveRecord::Base
  require 'file_size_validator'
  include CarrierWave::MiniMagick
  
belongs_to :organization
has_many :reviews, :dependent => :destroy
has_many :program_subjects, :dependent => :destroy
has_many :program_lengths, :dependent => :destroy
has_many :program_sizes, :dependent => :destroy
attr_accessible :id, :photo, :name, :description, :weekly_cost, :location, :organization_id, :subject, :group_size, :headquarters, :length, :overall, :chart, :program_started, :start_dates, :program_structure, :partnered_local_organizations, :cost_includes, :cost_doesnt_include, :program_cost_breakdown, :accommodations, :check_it_out, :organization_name, :crop_x, :crop_y, :crop_w, :crop_h, :square_image, :program_subjects, :program_lengths, :program_sizes, :specific_location
validates :photo, :file_size => {:maximum => 0.5.megabytes.to_i}
before_save :square_image_crop

# Paperclip
    mount_uploader :chart, ImageUploader
    mount_uploader :photo, ImageUploader
    mount_uploader :square_image, ImageUploader
# Sunspot Search
searchable do
  text :name
    text :location
    text :program_subjects, :multiple => true do
      program_subjects.map(&:subject)
    end
    text :organization_name
    string :weekly_cost
    string :program_sizes, :multiple => true do
      program_sizes.map(&:size)
    end
    string :program_lengths, :multiple => true do
      program_lengths.map(&:length)
    end
  
end

def roundup(overall)
    (overall*2).round / 2.0
end

def square_image_crop
   if !(self.crop_x.nil? || self.crop_y.nil? || self.crop_w.nil? || self.crop_h.nil?)
     image = MiniMagick::Image.open(self.photo.url)
     image.crop("#{self.crop_w}x#{self.crop_h}+#{self.crop_x}+#{self.crop_y}")
     image.set("page", "#{self.crop_w}x#{self.crop_h}+#{self.crop_x}+#{self.crop_y}") 
     self.square_image = image
   end
 end

 
end
