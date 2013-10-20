# encoding: utf-8
class TextComparator
  CHARS = Regexp.new('[^a-z01-9АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧЩШЪЫЬЭЮЯ\-]')
  
  def self.compare twitt, person
    t_ary = prepare twitt.text
    p_ary = prepare person.name
    
    t_ary & p_ary == p_ary
  end
  
 # private
    def self.prepare str
      #Все в вехрний регистр, Ё меняем на Е
      str = str.mb_chars.upcase.to_s.gsub(/Ё/, "Ё" => "Е")
      
      #Оставляем только буквы, цифры и символ - 
      str.gsub!(CHARS, " ")
      
      #Возвращаем массив
      str.split.sort
    end
end