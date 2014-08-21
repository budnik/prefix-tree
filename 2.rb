#!/usr/local/bin ruby
require 'set'
require 'pry'
require 'pry-rescue'

class Tire < Hash
  def initialize
    super {Tire.new}
  end

  def add_string(string)
    add string.chars
  end

  def add(array)
    k = array.shift
    if array.empty?
      self[k]=self[k].merge "\n"=> "\0"
    elsif self[k].nil? or self[k].empty?
      self[k]= Tire.new.add( array)
    elsif self[k].kind_of? Tire
      self[k].add(array) 
    end
    self
    # self[k]=.merge Tire.new.add(array)
  end
end
T = Tire.new
T.add_string "foo"
T.add_string "foos"
pp T
binding.pry

# i = 0 
# ARGF.each_line do |l|
#   binding.pry if i+=1 > 10
#   t.add_string l
# end

