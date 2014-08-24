class Player

  def initialize
    @health = 20
  end

  def play_turn(warrior)
    @warrior = warrior

    if warrior.feel.empty? && taking_damage?
      warrior.walk!
    elsif warrior.feel.empty? && !taking_damage?
      if less_than_full_health?
        warrior.rest!
      else
        warrior.walk!
      end
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif !warrior.feel.empty? && !taking_damage?
      if has_low_health?
        warrior.walk!(:backward)
      else
        if warrior.feel.captive?
          warrior.rescue!
        else
          warrior.attack!
        end
      end
    end

    @health = warrior.health
  end

  private

  def less_than_full_health?
    @warrior.health < 20
  end

  def has_low_health?
    @warrior.health < 8
  end

  def taking_damage?
    @warrior.health < @health
  end
end