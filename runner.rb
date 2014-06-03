#!/usr/bin/env ruby

require 'curses'

require_relative 'grid'

window = Curses::Window.new(0, 0, 0, 0)

width   = window.maxx - 1
height  = window.maxy - 1
density = 0.25

grid = Grid.new(width, height, density)

window.clear
loop do
  window.setpos(0, 0)
  window.addstr(grid.to_s)
  window.refresh
  grid.step()
end
