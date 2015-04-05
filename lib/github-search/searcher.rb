require 'faraday'
require 'json'

module GithubSearch
  class Searcher

    def search(*args, opts)
      search_string_builder = SearchStringBuilder.new
      search_string = search_string_builder.build_search_string(args, opts, @model)

      response = Faraday.get("#{API_URL}/#{@path}#{search_string}")
      items = JSON.parse(response.body)["items"]
      items.map { |attributes| @model.new(attributes) }
    end

    def issues
      @path = "issues"
      @model = Issue
      self
    end

    def repos
      @path = "repositories"
      @model = Repository
      self
    end

    def users
      @path = "users"
      @model = User
      self
    end

  end
end