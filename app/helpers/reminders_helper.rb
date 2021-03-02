module RemindersHelper
  def dose_formatter(number)
    if number > 1 && number.positive?
      ["Pílulas", "Gotas", "Colheres de Chá", "Colheres", "Miligramas", "Cápsulas", "Drágeas", "Comprimidos", "mg",
       "mg/mL"]
    else
      ["Pílula", "Gota", "Colher de Chá", "Colher", "Miligrama", "Cápsula", "Drágea", "Comprimido", "mg", "mg/mL"]
    end
  end

  def medicine_dose_value
    ["Pílula", "Gota", "Colher de Chá", "Colher", "Miligrama", "Cápsula", "Drágea", "Comprimido", "mg", "mg/mL"]
  end
end
