class Image
  attr_accessor :hubble_id, :name, :description, :credits, :file_url

  def initialize(args)
    @hubble_id = args[:id]
    @name = args[:name]
    @description = args[:description]
    @credits = args[:credits]
    @file_url = args[:image_files].first[:file_url]
  end

  def self.all
    instance.images
  end

  private

  def self.instance
    @@instance ||= HubbleService.new
  end
end
