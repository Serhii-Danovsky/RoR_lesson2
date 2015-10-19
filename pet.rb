require 'colorize'
class Tamagotchi

  def initialize name
    @name = name
    @bellyfuly = 100
    @happy = 100
    @toilet = 0
    @health = 100
    @smoking = 100
    puts @name + ' народився.'
  end

  def feed
    puts 'Чім будемо гудувати ?'
    puts '1- гамбургер'
    puts '2- яблоко'
    feed_choise = gets.chomp.to_i
    case feed_choise
    when 1 then
      @bellyfuly = @bellyfuly + 20
      @toilet = @toilet + 10
      @health = @health  + 15
      @happy =  @happy - 15
      @smoking = @smoking - 10
      puts 'Ви накормили ' + @name  + ' гамбургером.'
    when 2 then
      @bellyfuly = @bellyfuly + 10
      @health = @health  + 10
      @toilet = @toilet + 5
      @smoking = @smoking - 10
      puts 'Ви накормили ' + @name  + ' яблуком.'
    else
      puts 'Ви нічім не покормили  ' + @name
    end
    timelapse
  end

  def walk
     puts 'Ви погуляли з ' + @name
     @bellyfuly = @bellyfuly - 10
     @health = @health  + 10
     @happy =  @happy + 15
     @toilet = @toilet + 5
     timelapse
  end

  def scratch
     puts 'Ви почухали ' + @name
     @bellyfuly = @bellyfuly - 10
     @health = @health  + 20
     @happy =  @happy + 25
     @toilet = @toilet + 5
     timelapse
  end

   def gift
     puts 'Ви дали подарунок ' + @name
     @bellyfuly = @bellyfuly - 10
     @happy =  @happy + 40
     @toilet = @toilet + 5
     timelapse
  end

  def randomm
    random = [:gift, :scratch, :walk].sample
    self.send(random)
  end

  def play
    puts 'В що будемо грати ?'
    puts '1- Футбол на вулиці'
    puts '2- PS4'
    play_choise = gets.chomp.to_i
    case play_choise
    when 1 then
      @health = @health -15
      @happy =  @happy + 15
      @bellyfuly = @bellyfuly - 15
      @toilet = @toilet + 10
      @smoking = @smoking - 5
      puts 'Ви пограли з  ' + @name  + ' в футбол.'
    when 2 then
      @health = @health - 10
      @happy =  @happy + 15
      @bellyfuly = @bellyfuly - 10
      @toilet = @toilet + 5
      @smoking = @smoking - 5
      puts 'Ви пограли з  ' + @name  + 'на PS4.'
    else
      puts 'Ви не грали з   ' + @name
    end
    timelapse
  end

  def gotoilet
    puts   @name + ' сходив в туалет  '
    @toilet = 0
    timelapse
  end

  def medicine
    puts 'Що будемо робити?'
    puts '1- ЇСти вітаміни'
    puts '2- Лікуватись уколом'
    medicine_choise = gets.chomp.to_i
    case medicine_choise
    when 1 then
      @health = @health + 25
      @happy =  @happy + 10
      @bellyfuly = @bellyfuly + 5
      @toilet = @toilet + 5
      @smoking = @smoking - 5
      puts 'Ви  дали   ' + @name  + ' вітаміни.'
    when 2 then
      @health = @health + 50
      @happy =  @happy - 20
      @bellyfuly = @bellyfuly - 20
      @toilet = @toilet + 10
      @smoking = @smoking - 5
      puts 'Ви зробили  ' + @name  + 'укол.'
    else
      puts 'Ви нічого не зробили з    ' + @name
    end
    timelapse
  end

  def smoki
      puts 'Як будемо поповняти нікотин?'
      puts '1- курити'
      puts '2- нікотиновий пластир'
      smoki_choise = gets.chomp.to_i
    case smoki_choise
    when 1 then
      @health = @health - 20
      @happy =  @happy + 10
      @bellyfuly = @bellyfuly - 15
      @toilet = @toilet + 5
      @smoking = @smoking + 20
      puts 'Ви  дали   ' + @name  + ' сигарету.'
    when 2 then
      @health = @health - 30
      @happy =  @happy + 20
      @bellyfuly = @bellyfuly - 20
      @toilet = @toilet + 10
      @smoking = @smoking +30
      puts 'Ви дали  ' + @name  + 'нікотиновий пластир.'
    else
      puts 'Ви нічого не зробили з    ' + @name
    end
    timelapse
  end

  def timelapse
    dead
    puts "Ситість".colorize(:red).on_blue.underline
    @bellyfuly = @bellyfuly - rand(7)
    case @bellyfuly
    when   80..300 then puts "Ситість #{@bellyfuly} - #{@name} ситий ".green
    when    40..80  then puts "Ситість #{@bellyfuly} - #{@name} не проти поїсти".yellow
    when  -100..40  then puts "Ситість #{@bellyfuly}- #{@name} голодує".red
    end

    puts "Щастя".colorize(:red).on_blue.underline
    @happy =  @happy - rand(7)
    case @happy
    when    80..300 then puts "Щастя #{@happy} - #{@name} веселий ".green
    when    40..80  then puts "Щастя #{@happy} - #{@name} не проти повеселитися".yellow
    when  -100..40  then puts "Щастя #{@happy}- #{@name} невеселий".red
    end

    puts "Туалет".colorize(:red).on_blue.underline
    @toilet = @toilet + rand(5)
    case @toilet
    when    50..300  then puts "Туалет #{@toilet} - #{@name}  хоче в туалет".red
    when  -100..50   then puts "Туалет #{@toilet} - #{@name} не хоче в туалет".green
    end

    puts "Здоров*я".colorize(:red).on_blue.underline
    @health = @health - rand(7)
    case @health
    when    80..300  then puts "Здоров*я #{@health} - #{@name} - здоровий ".green
    when    40..80   then puts "Здоров*я #{@health} - #{@name} - почуває себе нормально".yellow
    when  -100..40   then puts "Здоров*я #{@health} - #{@name} - нездужає ".red
    end

    puts "Куріння".colorize(:red).on_blue.underline
    @smoking = @smoking - rand(7)
    case @smoking
    when   80..300  then puts "Куріння #{@smoking} - #{@name} - не хоче курити ".green
    when   40..80   then puts "Куріння #{@smoking} - #{@name} - не проти закурити ".yellow
    when -100..40   then puts "Куріння #{@smoking} - #{@name} - хоче курити".red
    end
    notification
  end

  def notification
    if @bellyfuly <= 15
      puts "Негайно покорміть #{@name} ,або  він помре".red
    end

    if @happy <= 15
      puts "Негайно пограйтесь з #{@name} ,або  він помре".red
    end

    if @health <= 15
      puts "Негайно полікуйте #{@name} ,або  він помре".red
    end

    if @toilet >= 100
      puts "Негайно зводіть   #{@name} в туалет , або  він помре".red
    end

    if @smoking <= 10
      puts "Негайно дайте дозу нікотину   #{@name} , або  він помре".red
    end
  end

  def dead
    if @bellyfuly <= 0
      puts "#{@name} помер від голоду".blue.on_red
      exit
    end

    if @happy <= 0
      puts "#{@name} помер від нещастя".blue.on_red
      exit
    end

    if @health <= 0
      puts "#{@name} помер від проблем зі здоров*ям".blue.on_red
      exit
    end

    if @toilet >= 100
      puts "#{@name} помер від того що не зміг сходити в туалет".blue.on_red
      exit
    end

    if @smoking <= 1
      puts "#{@name} помер від того що не  отримав нікотину".blue.on_red
      exit
    end
  end

  def help
     puts 'feed - Кормити вашого пета'
     puts 'play - Гратись з вашим  петом'
     puts 'gotoilet - Йти в туалет з вашим  петом'
     puts 'medicine - Лікувати вашого пета'
     puts 'smoki -  Курити з вашим  петом'
     puts 'timelapse -  Проміжок часу'
     puts 'walk -  Гуляти з вашим  петом'
     puts 'scratch -  Почухати вашого пета'
     puts 'gift - Подарувати подарунок'
     puts 'randomm - Випадкова дія'
  end
end
puts 'Як звати вашого пета?'
name = gets.chomp
pet = Tamagotchi.new name
loop do
  puts
  puts 'команди: feed, play, gotoilet, medicine, smoki, timelapse, walk, help, scratch, gift, randomm, exit'
  command = gets.chomp
  if command == 'exit'
    exit
  elsif pet.respond_to?(command)
        pet.send command
  else
    puts "Неправильно введена команда.".blue.on_red
  end
end


