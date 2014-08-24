class Player
	attr_accessor :health

  def play_turn(warrior)
  	@warrior = warrior

  	if can_move_forward? && (being_attacked? || dont_need_no_recovery?)
  		@warrior.walk!
  	elsif need_recovery? && can_recover_safely?
  		@warrior.rest!
  	else
  		if need_recovery? && !being_attacked?
  			@warrior.walk!(:backward)
  		else
  			@warrior.attack!
  		end
  	end

  	self.health = @warrior.health


  	# if can_move_forward?
  	# 	@warrior.walk!
  	# elsif need_recovery?
  	# 	@warrior.rest!
  	# else
  	# 	@health = @warrior.health
  	# 	if !need_recovery? || !being_attacked?
  	# 		@warrior.attack!
  	# 	else
  	# 		@warrior.walk(:backward)
  	# 	end
  	# end


  	# if warrior.feel.empty?
  	# 	if warrior.health >= 20 || warrior.health <= @health
  	# 		warrior.walk!
  	# 	else 
  	# 		warrior.rest!
  	# 	end
  	# else
  	# 	if warrior.health <= 12
  	# 		warrior.walk!(:backward)
  	# 	else 
  	# 		@health = warrior.health
  	# 		warrior.attack!
  	# 	end
  	# end

  end

  private
  def health
  	@health || 0
  end

  def being_attacked?
  	health > @warrior.health
  end

  def can_move_forward?
  	@warrior.feel.empty?
  end

  def need_recovery?
  	@warrior.health <= 12
  end

  def dont_need_no_recovery?
  	!need_recovery?
  end

  def can_recover_safely?
  	@warrior.health == health
  end

  def cannot_recover_safely?
  	!can_recover_safely?
  end
end
