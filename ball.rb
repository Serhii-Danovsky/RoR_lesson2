require 'colorize'
class Ball
	def shake
	answers  = {0 => 'Don’t count on it',
		    1 => 'My reply is no',
	            2 => 'My sources say no',
	            3 => 'Outlook not so good',
	            4 => 'Very doubtful',

                    5 => 'As I see it, yes',
                    6 => 'Most likely',
                    7 => 'Outlook good',
                    8 => 'Signs point to yes',
                    9 => 'Yes',

                   10 => 'Reply hazy, try again',
                   11 => 'Ask again later',
                   12 => 'Better not tell you now',
                   13 => 'Cannot predict now',
                   14 => 'Concentrate and ask again',

                   15 => 'It is certain',
                   16 => 'It is decidedly so',
                   17 => 'Without a doubt',
                   18 => 'Yes — definitely',
                   19 => 'You may rely on it' }

                random_choise = rand(20)
                print "Thinking "

                (1..5).each { |i| print ". "; sleep(1) }

                case random_choise
		when 0..4   then puts answers[random_choise].to_s.blue
		when 5..9   then puts answers[random_choise].to_s.green
		when 10..14 then puts answers[random_choise].to_s.yellow
		when 15..19 then puts answers[random_choise].to_s.red
		end
	end
end
Magic8ball = Ball.new
Magic8ball.shake
