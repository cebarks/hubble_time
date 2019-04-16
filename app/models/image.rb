class Image
  attr_accessor :id, :name, :description, :credits, :image_files
  
  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @description = args[:description]
    @credits = args[:credits]
    @image_files = args[:image_files]
  end

  def self.all
    instance.images
  end

  private

  def self.instance
    @@instance ||= HubbleService.new
  end
end
