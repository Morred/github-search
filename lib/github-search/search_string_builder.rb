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
      sort_string = sort_untangler(opts[:sort]) if opts[:sort]
      opts.delete(:sort)

      order_string = order_untangler(opts[:order]) if opts[:order]
      opts.delete(:order)

      search_params = ""
      plus = ""
      opts.each do |key, value|
        search_params += "#{plus}#{key}:#{value}"
        plus = "+"
      end
      search_params += sort_string || ""
      search_params += order_string || ""
    end

    def sort_untangler(sort_param)
      if [:stars, :forks, :updated].include?(sort_param)
        sort_string = "&sort=#{sort_param.to_s}"
      else
        # todo: error handling
        puts "You can only sort repositories for :stars, :forks or :updated (default is best match)"
      end
    end

    def order_untangler(order_param)
      if [:asc, :desc].include?(order_param)
        order_string = "&order=#{order_param.to_s}"
      else
        # todo: error handling
        puts "You can only order repositories with :asc or :desc (default is desc)"
      end
    end

  end
end
