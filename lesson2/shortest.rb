# frozen_string_literal: true
inp = gets.chomp.downcase.split(" ")

mini = 100000
inp.each do |s|
  if s.length < mini
    mini = s.length
  end
end
p mini