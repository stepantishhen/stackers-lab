class Raspberry
  @@states = ["Отсутствует", "Цветение", "Зелёная", "Красная"]

  protected
  def initialize(index)
    @index = index
    @state = @@states.first
  end

  def self.states
    @@states
  end

  public
  def grow!
    @state = @@states[@@states.index(@state) + 1] unless ripe?
  end

  def ripe?
    @state == @@states.last
  end
end


class RaspberryBush
  def initialize(num_raspberries)
    @raspberries = Array.new(num_raspberries) { Raspberry.new 0 }
  end

  def grow_all!
    @raspberries.each(&:grow!)
  end

  def ripe_all?
    @raspberries.all?(&:ripe?)
  end

  def give_away_all!
    @raspberries = []
  end
end

class Human
  attr_reader :name

  def initialize(name, plant)
    @name = name
    @plant = plant
  end

  def work!
    @plant.grow_all!
  end

  def harvest
    if @plant.ripe_all?
      @plant.give_away_all!
      puts "#{@name} собрал урожай!"
    else
      puts "Ещё рано собирать урожай."
    end
  end

  def self.knowledge_base
    puts "Совет: Малину лучше всего сажать в начале весны или в конце осени."
  end
end

if __FILE__ == $PROGRAM_NAME
  Human.knowledge_base

  bush = RaspberryBush.new(5)
  human = Human.new("Иван", bush)

  puts "Начинаем ухаживать за кустом с малиной..."
  3.times do
    human.work!
  end

  puts "Пытаемся собрать урожай..."
  human.harvest

  while !bush.ripe_all?
    puts "Малина еще не дозрела, продолжаем ухаживать..."
    human.work!
  end

  puts "Малина дозрела! Собираем урожай..."
  human.harvest
end
