class HubbleService
  def image(id)
    JSON.parse(conn.get("image/#{id}").body, symbolize_names: true)
  end

  def images
    raw = JSON.parse(conn.get("images/all").body, symbolize_names: true)

    raw.map! do |raw_image_basic|
      image(raw_image_basic[:id]).merge(id: raw_image_basic[:id])
    end

    raw.map do |raw_image|
      Image.new(raw_image)
    end
  end

  private

  def conn
    @conn ||= Faraday.new(url: "http://hubblesite.org/api/v3/")
  end
end
