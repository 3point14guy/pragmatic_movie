module Flicks
  module  Rankable

    def thumbs_up
      # better practice to rely on a method or attribute in the mixin class vs an instance variable
      # @rank = @rank + 1
      self.rank += 1
    end

    def thumbs_down
      # @rank -= 1
      self.rank -= 1
    end

    def <=>(other)
      # other.rank <=> @rank
      other.rank <=> self.rank
    end

    def normalized_rank
      # @rank / 10
      self.rank / 10
    end

    def hit?
      # @rank >= 10
      self.rank >= 10
    end

    def status
      hit? ? "Hit" : "Flop"
    end

  end
end
