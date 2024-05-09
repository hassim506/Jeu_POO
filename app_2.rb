
  require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Accueil
puts "------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !    |"
puts "| Le but du jeu est d'être le dernier survivant!|"
puts "-------------------------------------------------"

# Initialisation du joueur
puts "Quel est ton prénom ?"
print "> "
player_name = gets.chomp
user = HumanPlayer.new(player_name)

# Initialisation des ennemis
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

# Combat
while user.life_points.positive? && (player1.life_points.positive? || player2.life_points.positive?)
  puts "\n#{user.show_state}"
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "attaquer un joueur en vue :"
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"
  print "> "
  choice = gets.chomp
  case choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(player1)
  when "1"
    user.attacks(player2)
  else
    puts "Choix invalide. Réessaye !"
  end

  puts "Les autres joueurs t'attaquent !"
  enemies.each do |enemy|
    if enemy.life_points.positive?
      enemy.attacks(user)
    end
  end
end

# Fin du jeu
puts "\nLa partie est finie"
if user.life_points.positive?
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
