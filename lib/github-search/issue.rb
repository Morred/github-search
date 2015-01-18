require 'faraday'
require 'json'

module GithubSearch
  class Issue
    attr_reader :id,
                :number,
                :title,
                :body,
                :url,
                :labels_url,
                :comments_url,
                :events_url,
                :html_url,
                :user,
                :labels,
                :state,
                :locked,
                :assignee,
                :milestone,
                :comments,
                :created_at,
                :updated_at,
                :closed_at,
                :score

    def initialize(attributes)
      @id = attributes["id"]
      @number = attributes["number"]
      @title = attributes["title"]
      @body = attributes["body"]
      @url = attributes["url"]
      @labels_url = attributes["labels_url"]
      @comments_url = attributes["comments_url"]
      @events_url = attributes["events_url"]
      @html_url = attributes["html_url"]
      @user = attributes["user"]
      @labels = attributes["labels"]
      @state = attributes["state"]
      @locked = attributes["locked"]
      @assignee = attributes["assignee"]
      @milestone = attributes["milestone"]
      @comments = attributes["comments"]
      @created_at = attributes["created_at"]
      @updated_at = attributes["updated_at"]
      @closed_at = attributes["closed_at"]
      @score = attributes["score"]
    end

    def self.path
      "issues"
    end

    def self.search(*args, opts)
      search_string = build_search_string(args, opts)

      response = Faraday.get("#{API_URL}/#{path}#{search_string}")
      items = JSON.parse(response.body)["items"]
      items.map { |attributes| new(attributes) }
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