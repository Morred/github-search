require 'faraday'
require 'json'

module GithubSearch
  class Repository < Searcher
    attr_reader :id,
                :name,
                :full_name,
                :owner,
                :private,
                :html_url,
                :description,
                :fork,
                :url,
                :forks_url,
                :keys_url,
                :collaborators_url,
                :teams_url,
                :hooks_url,
                :issue_events_url,
                :events_url,
                :assignees_url,
                :branches_url,
                :tags_url,
                :blobs_url,
                :git_tags_url,
                :git_refs_url,
                :trees_url,
                :statuses_url,
                :languages_url,
                :stargazers_url,
                :contributors_url,
                :subscribers_url,
                :subscription_url,
                :commits_url,
                :git_commits_url,
                :comments_url,
                :issue_comment_url,
                :contents_url,
                :compare_url,
                :merges_url,
                :archive_url,
                :downloads_url,
                :issues_url,
                :pulls_url,
                :milestones_url,
                :notifications_url,
                :labels_url,
                :releases_url,
                :created_at,
                :updated_at,
                :pushed_at,
                :git_url,
                :ssh_url,
                :clone_url,
                :svn_url,
                :homepage,
                :size,
                :stargazers_count,
                :watchers_count,
                :language,
                :has_issues,
                :has_downloads,
                :has_wiki,
                :has_pages,
                :forks_count,
                :mirror_url,
                :open_issues_count,
                :forks,
                :open_issues,
                :watchers,
                :default_branch,
                :score

    def initialize(attributes)
      @id                   = attributes["id"]
      @name                 = attributes["name"]
      @full_name            = attributes["full_name"]
      @owner                = attributes["owner"]
      @private              = attributes["private"]
      @html_url             = attributes["html_url"]
      @description          = attributes["description"]
      @fork                 = attributes["fork"]
      @url                  = attributes["url"]
      @forks_url            = attributes["forks_url"]
      @keys_url             = attributes["keys_url"]
      @collaborators_url    = attributes["collaborators_url"]
      @teams_url            = attributes["teams_url"]
      @hooks_url            = attributes["hooks_url"]
      @issue_events_url     = attributes["issue_events_url"]
      @events_url           = attributes["events_url"]
      @assignees_url        = attributes["assignees_url"]
      @branches_url         = attributes["branches_url"]
      @tags_url             = attributes["tags_url"]
      @blobs_url            = attributes["blobs_url"]
      @git_tags_url         = attributes["git_tags_url"]
      @git_refs_url         = attributes["git_refs_url"]
      @trees_url            = attributes["trees_url"]
      @statuses_url         = attributes["statuses_url"]
      @languages_url        = attributes["languages_url"]
      @stargazers_url       = attributes["stargazers_url"]
      @contributors_url     = attributes["contributors_url"]
      @subscribers_url      = attributes["subscribers_url"]
      @subscription_url     = attributes["subscription_url"]
      @commits_url          = attributes["commits_url"]
      @git_commits_url      = attributes["git_commits_url"]
      @comments_url         = attributes["comments_url"]
      @issue_comment_url    = attributes["issue_comment_url"]
      @contents_url         = attributes["contents_url"]
      @compare_url          = attributes["compare_url"]
      @merges_url           = attributes["merges_url"]
      @archive_url          = attributes["archive_url"]
      @downloads_url        = attributes["downloads_url"]
      @issues_url           = attributes["issues_url"]
      @pulls_url            = attributes["pulls_url"]
      @milestones_url       = attributes["milestones_url"]
      @notifications_url    = attributes["notifications_url"]
      @labels_url           = attributes["labels_url"]
      @releases_url         = attributes["releases_url"]
      @created_at           = attributes["created_at"]
      @updated_at           = attributes["updated_at"]
      @pushed_at            = attributes["pushed_at"]
      @git_url              = attributes["git_url"]
      @ssh_url              = attributes["ssh_url"]
      @clone_url            = attributes["clone_url"]
      @svn_url              = attributes["svn_url"]
      @homepage             = attributes["homepage"]
      @size                 = attributes["size"]
      @stargazers_count     = attributes["stargazers_count"]
      @watchers_count       = attributes["watchers_count"]
      @language             = attributes["language"]
      @has_issues           = attributes["has_issues"]
      @has_downloads        = attributes["has_downloads"]
      @has_wiki             = attributes["has_wiki"]
      @has_pages            = attributes["has_pages"]
      @forks_count          = attributes["forks_count"]
      @mirror_url           = attributes["mirror_url"]
      @open_issues_count    = attributes["open_issues_count"]
      @forks                = attributes["forks"]
      @open_issues          = attributes["open_issues"]
      @watchers             = attributes["watchers"]  
      @default_branch       = attributes["default_branch"]   
      @score                = attributes["score"]
    end

  end
end