module PortfoliosHelper
  def image_generator(height:, width:)
    "http://place-hold.it/#{height}x#{width}"
  end

  def portfolio_img img, type
    if img.present?
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200')
    else
      image_generator(height: '600', width: '400')
    end
  end
end
