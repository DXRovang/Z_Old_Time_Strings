module InstrumentsHelper
  def self.family
    self.category.family.name
  end

  def banjo_categories
    Category.where(id: [1...5])
  end

  def mandolin_categories
    Category.where(id: [5...8])
  end

  def guitar_categories
    Category.where(id: [8...16])
  end

  # def banjo 
  #   (1..4).to_a.include?(instrument_params[:category_id].to_i)
  # end

  # def guitar 
  #   (8..15).to_a.include?(instrument_params[:category_id].to_i)
  # end

  # def mandolin 
  #   (5..7).to_a.include?(instrument_params[:category_id].to_i)
  # end

end
