require 'faraday'
require 'json'

module GithubSearch
  class Issue < Searcher
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
      @id             = attributes["id"]
      @number         = attributes["number"]
      @title          = attributes["title"]
      @body           = attributes["body"]
      @url            = attributes["url"]
      @labels_url     = attributes["labels_url"]
      @comments_url   = attributes["comments_url"]
      @events_url     = attributes["events_url"]
      @html_url       = attributes["html_url"]
      @user           = attributes["user"]
      @labels         = attributes["labels"]
      @state          = attributes["state"]
      @locked         = attributes["locked"]
      @assignee       = attributes["assignee"]
      @milestone      = attributes["milestone"]
      @comments       = attributes["comments"]
      @created_at     = attributes["created_at"]
      @updated_at     = attributes["updated_at"]
      @closed_at      = attributes["closed_at"]
      @score          = attributes["score"]
    end

    def self.sort_options
      [:comments, :created, :updated]
    end

  end
end