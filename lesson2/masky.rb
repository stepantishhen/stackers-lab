# frozen_string_literal: true
inp = gets.chomp
if inp.length < 4
  p inp
else
  p "#" * (inp.length - 4) + inp[inp.length - 4, inp.length]
end