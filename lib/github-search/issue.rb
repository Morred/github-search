require 'faraday'
require 'json'

module GithubSearch
  class Issue
    attr_reader :id

    def self.path
      "issues"
    end

    def self.search(*args, opts)

      search_string = build_search_string(args, opts)
      puts path

      response = Faraday.get("#{API_URL}/#{path}#{search_string}")
      attributes = JSON.parse(response.body)
      attributes["items"]
    end

    def self.build_search_string(args, opts)

      args_string = args_untangler(args)
      opts_string = opts_untangler(opts)

      search_string = args_string
      search_string += "+" if opts_string
      search_string += opts_string
    end

    def self.args_untangler(args)
      search_params = "?q="
      plus = ""
      args.each do |search_term|
        search_params += "#{plus}#{search_term}"
        plus = "+"
      end
      search_params
    end

    def self.opts_untangler(opts)
      search_params = ""
      plus = ""
      opts.each do |key, value|
        search_params += "#{plus}#{key}:#{value}"
        plus = "+"
      end
      search_params
    end

  end
end