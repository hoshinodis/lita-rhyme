module Lita
  module Handlers
    class Rhymer < Handler
      route(/.*/, :gen_rhyme)
      def gen_rhyme(response)
        rhymer = Rhymer::Parser.new(response.matches[0])
        if rhymer.size > 0
          rhyme = rhymer.rhymes.sample
          response.reply([rhyme[0], rhyme[1]].join(" "))
        end
      end

      Lita.register_handler(self)
    end
  end
end
