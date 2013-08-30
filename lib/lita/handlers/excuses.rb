require "lita"
require "nokogiri"

module Lita
  module Handlers
    class Excuses < Handler
      route %r{^excuse$}i, :excuse, command: true, help: { "excuse" => "Responds with a random excuse." }

      def excuse(response)
        response.reply retrieve_excuse
      end

      private 

      def retrieve_excuse

        resp = http.get('http://programmingexcuses.com/')

        doc = Nokogiri::HTML(resp.body)

        "\"#{doc.css('a').text}\""
      rescue
        "Sorry, I was unable to come up with a good excuse for you."
      end

    end

    Lita.register_handler(Excuses)
  end
end
