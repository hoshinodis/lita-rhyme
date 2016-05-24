module Lita
  module Handlers
    class Rhyme < Handler
      route(/.*/, :gen)
      def gen(response)
        rhymer = Rhymer::Parser.new(response.matches[0])
        if rhymer.rhymes.size > 0
          rhyme = rhymer.rhymes.sample
          response.reply([rhyme[0], rhyme[1]].join(" "))
        end
      end

      Lita.register_handler(self)
    end
  end
end
