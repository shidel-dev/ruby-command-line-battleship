ruby-command-line-battleship
============================

A command implementation of game battleship written in ruby.


glossery:

a = aircraft carrier

b = battleship

c = crusier

d = distroyer

s = submarine


To make a game:

game = Game.new()

To place pieces: 

game.place_ship(type,orientation,cordinates)  ex.. game.place_ship('b','horizontal',[2,'a'])


to start: 

game.start

to fire:

game.fire(cordinates)  ex..  game.fire([4,'j']) 
