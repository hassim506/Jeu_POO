require 'bundler'

  Bundler.require

  require_relative 'lib/game'

  require_relative 'lib/player'

  binding.pry


  # app.rb
require_relative 'player'

# Création des joueurs
player1 = Player.new("Josiane")
player2 = Player.new("José")

# Présentation des joueurs
puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state

# Début du combat
puts "Passons à la phase d'attaque :"

# Combat
while player1.life_points > 0 && player2.life_points > 0
  puts "\nRound suivant :"
  player1.attacks(player2)
  break if player2.life_points <= 0

  player2.attacks(player1)
  break if player1.life_points <= 0
end
