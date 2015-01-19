require './test/test_helper'

class RepositoryTest < Minitest::Test
  def test_exists
    assert GithubSearch::Repository
  end

  def test_returns_repositories
    VCR.use_cassette('search_repositories') do
      github = GithubSearch::Searcher.new
      result = github.repos.search("github", user: "Morred", fork: false)

      assert_equal Array, result.class
      assert_equal 1, result.length
      assert_equal GithubSearch::Repository, result.first.class

      # Check that the fields are accessible by our model
      assert_equal 29250518, result.first.id
      assert_equal "github-search", result.first.name
      assert_equal "Morred/github-search", result.first.full_name
      assert_equal "Morred", result.first.owner["login"]
      assert_equal false, result.first.private
      assert_equal "https://github.com/Morred/github-search", result.first.html_url
      assert_equal "", result.first.description
      assert_equal false, result.first.fork

      assert_equal "https://api.github.com/repos/Morred/github-search", result.first.url
      assert_equal "https://api.github.com/repos/Morred/github-search/forks", result.first.forks_url
      assert_equal "https://api.github.com/repos/Morred/github-search/keys{/key_id}", result.first.keys_url
      assert_equal "https://api.github.com/repos/Morred/github-search/collaborators{/collaborator}", result.first.collaborators_url
      assert_equal "https://api.github.com/repos/Morred/github-search/teams", result.first.teams_url
      assert_equal "https://api.github.com/repos/Morred/github-search/hooks", result.first.hooks_url
      assert_equal "https://api.github.com/repos/Morred/github-search/issues/events{/number}", result.first.issue_events_url
      assert_equal "https://api.github.com/repos/Morred/github-search/events", result.first.events_url
      assert_equal "https://api.github.com/repos/Morred/github-search/assignees{/user}", result.first.assignees_url
      assert_equal "https://api.github.com/repos/Morred/github-search/branches{/branch}", result.first.branches_url
      assert_equal "https://api.github.com/repos/Morred/github-search/tags", result.first.tags_url
      assert_equal "https://api.github.com/repos/Morred/github-search/git/blobs{/sha}", result.first.blobs_url
      assert_equal "https://api.github.com/repos/Morred/github-search/git/tags{/sha}", result.first.git_tags_url
      assert_equal "https://api.github.com/repos/Morred/github-search/git/refs{/sha}", result.first.git_refs_url
      assert_equal "https://api.github.com/repos/Morred/github-search/git/trees{/sha}", result.first.trees_url
      assert_equal "https://api.github.com/repos/Morred/github-search/statuses/{sha}", result.first.statuses_url
      assert_equal "https://api.github.com/repos/Morred/github-search/languages", result.first.languages_url
      assert_equal "https://api.github.com/repos/Morred/github-search/stargazers", result.first.stargazers_url
      assert_equal "https://api.github.com/repos/Morred/github-search/contributors", result.first.contributors_url
      assert_equal "https://api.github.com/repos/Morred/github-search/subscribers", result.first.subscribers_url
      assert_equal "https://api.github.com/repos/Morred/github-search/subscription", result.first.subscription_url
      assert_equal "https://api.github.com/repos/Morred/github-search/commits{/sha}", result.first.commits_url
      assert_equal "https://api.github.com/repos/Morred/github-search/git/commits{/sha}", result.first.git_commits_url
      assert_equal "https://api.github.com/repos/Morred/github-search/comments{/number}", result.first.comments_url
      assert_equal "https://api.github.com/repos/Morred/github-search/issues/comments/{number}", result.first.issue_comment_url
      assert_equal "https://api.github.com/repos/Morred/github-search/contents/{+path}", result.first.contents_url
      assert_equal "https://api.github.com/repos/Morred/github-search/compare/{base}...{head}", result.first.compare_url
      assert_equal "https://api.github.com/repos/Morred/github-search/merges", result.first.merges_url
      assert_equal "https://api.github.com/repos/Morred/github-search/{archive_format}{/ref}", result.first.archive_url
      assert_equal "https://api.github.com/repos/Morred/github-search/downloads", result.first.downloads_url
      assert_equal "https://api.github.com/repos/Morred/github-search/issues{/number}", result.first.issues_url
      assert_equal "https://api.github.com/repos/Morred/github-search/pulls{/number}", result.first.pulls_url
      assert_equal "https://api.github.com/repos/Morred/github-search/milestones{/number}", result.first.milestones_url
      assert_equal "https://api.github.com/repos/Morred/github-search/notifications{?since,all,participating}", result.first.notifications_url
      assert_equal "https://api.github.com/repos/Morred/github-search/labels{/name}", result.first.labels_url
      assert_equal "https://api.github.com/repos/Morred/github-search/releases{/id}", result.first.releases_url

      assert_equal "2015-01-14T15:24:13Z", result.first.created_at
      assert_equal "2015-01-18T15:06:53Z", result.first.updated_at
      assert_equal "2015-01-18T15:06:52Z", result.first.pushed_at
      assert_equal "git://github.com/Morred/github-search.git", result.first.git_url
      assert_equal "git@github.com:Morred/github-search.git", result.first.ssh_url
      assert_equal "https://github.com/Morred/github-search.git", result.first.clone_url
      assert_equal "https://github.com/Morred/github-search", result.first.svn_url
      assert_equal nil, result.first.homepage
      assert_equal 0, result.first.size
      assert_equal 0, result.first.stargazers_count
      assert_equal 0, result.first.watchers_count
      assert_equal "Ruby", result.first.language
      assert_equal true, result.first.has_issues
      assert_equal true, result.first.has_downloads
      assert_equal true, result.first.has_wiki
      assert_equal false, result.first.has_pages
      assert_equal 0, result.first.forks_count
      assert_equal nil, result.first.mirror_url
      assert_equal 3, result.first.open_issues_count
      assert_equal 0, result.first.forks
      assert_equal 3, result.first.open_issues
      assert_equal 0, result.first.watchers
      assert_equal "master", result.first.default_branch
      assert_equal 1.5138767, result.first.score
    end
  end
end