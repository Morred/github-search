require 'faraday'
require 'json'

module GithubSearch
  class User < Searcher
    attr_reader :id,
                :login,
                :avatar_url,
                :gravatar_id,
                :url,
                :html_url,
                :followers_url,
                :following_url,
                :gists_url,
                :starred_url,
                :subscriptions_url,
                :organizations_url,
                :repos_url,
                :events_url,
                :received_events_url,
                :type,
                :site_admin,
                :score

    def initialize(attributes)
      @id                     = attributes["id"]
      @login                  = attributes["login"]
      @avatar_url             = attributes["avatar_url"]
      @gravatar_id            = attributes["gravatar_id"]
      @url                    = attributes["url"]
      @html_url               = attributes["html_url"]
      @followers_url          = attributes["followers_url"]
      @following_url          = attributes["following_url"]
      @gists_url              = attributes["gists_url"]
      @starred_url            = attributes["starred_url"]
      @subscriptions_url      = attributes["subscriptions_url"]
      @organizations_url      = attributes["organizations_url"]
      @repos_url              = attributes["repos_url"]
      @events_url             = attributes["events_url"]
      @received_events_url    = attributes["received_events_url"]
      @type                   = attributes["type"]
      @site_admin             = attributes["site_admin"]
      @score                  = attributes["score"]
    end

    def self.sort_options
      [:followers, :repositories, :joined]
    end

  end
end