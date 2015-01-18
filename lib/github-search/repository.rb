require 'faraday'
require 'json'

module GithubSearch
  class Repository < Searcher

    def self.path
      "repositories"
    end

    def self.search(*args, opts)
      super
    end

  end
end