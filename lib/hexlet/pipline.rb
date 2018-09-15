module Hexlet
  class Pipline
    def middle(list)
      middle_index = list.length / 2
      list.at(middle_index)
    end

    def plural(str, symbol)
      str.end_with?("s") ? str : "#{str}#{symbol}"
    end

    def main
      list = Dir.entries(".").
                select { |f| File.file?(f) }.
                select{ |f| !f.start_with?('.') }.
                sort

      str = middle(list)
      plural = plural(middle, 's')
    end
  end
end
