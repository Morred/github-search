require 'faraday'
require 'json'

module GithubSearch
  class Issue

    def issue_path
      "/issues"
    end

    def self.search(opts)
      search_params = opts
      response = Faraday.get("#{API_URL}/#{issue_path}/#{id}")
      attributes = JSON.parse(response.body)
    end

  end
end