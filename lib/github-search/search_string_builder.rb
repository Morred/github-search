require 'faraday'
require 'json'

module GithubSearch
  class SearchStringBuilder

    def build_search_string(args, opts)
      args_string = args_untangler(args)
      opts_string = opts_untangler(opts)

      search_string = args_string
      search_string += "+" if opts_string
      search_string += opts_string
    end

    def args_untangler(args)
      search_params = "?q="
      plus = ""
      args.each do |search_term|
        search_params += "#{plus}#{search_term}"
        plus = "+"
      end
      search_params
    end

    def opts_untangler(opts)
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