require "lita"
require "nokogiri"

module Lita
  module Handlers
    class Excuses < Handler
      route %r{excuse}i, :excuse, command: true, help: { "excuse" => "Responds with a random excuse." }
      route %r{!excuse}i, :excuse, command: false

      def excuse(response)
        response.reply retrieve_excuse
      end

      private 

      def retrieve_excuse
        doc = Nokogiri::HTML(open("http://programmingexcuses.com/"))
        "\"#{doc.css('a').text}\""
      rescue Exception => e
        puts e.inspect
        "Sorry, I was unable to come up with a good excuse for you."
      end

    end

    Lita.register_handler(Excuses)
  end
end
