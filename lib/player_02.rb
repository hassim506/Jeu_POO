class HumanPlayer < player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    dice_roll = rand(1..6)
    case dice_roll
    when 1
      puts "Tu n'as rien trouvé... "
    when 2..5
      heal = [50, 100 - @life_points].min
      @life_points += heal
      puts "Bravo, tu as trouvé un pack de +#{heal} points de vie !"
    when 6
      heal = [80, 100 - @life_points].min
      @life_points += heal
      puts "Waow, tu as trouvé un pack de +#{heal} points de vie !"
    end
  end
end
