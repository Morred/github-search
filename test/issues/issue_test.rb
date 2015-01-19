require './test/test_helper'

class IssueTest < Minitest::Test
  def test_exists
    assert GithubSearch::Issue
  end

  def test_returns_issues

    VCR.use_cassette('search_issues') do
      result = GithubSearch::Issue.search("test", "issue", repo: "Morred/github-search", label: "enhancement")

      assert_equal Array, result.class
      assert_equal 2, result.length
      assert_equal GithubSearch::Issue, result.first.class

      # Check that the fields are accessible by our model
      assert_equal 54452074, result.first.id
      assert_equal 2, result.first.number
      assert_equal "This is another test issue.", result.first.title
      assert_equal "This is another test issue.", result.first.body 
      assert_equal "https://api.github.com/repos/Morred/github-search/issues/2", result.first.url
      assert_equal "https://api.github.com/repos/Morred/github-search/issues/2/labels{/name}", result.first.labels_url
      assert_equal "https://api.github.com/repos/Morred/github-search/issues/2/comments", result.first.comments_url
      assert_equal "https://api.github.com/repos/Morred/github-search/issues/2/events", result.first.events_url
      assert_equal "https://github.com/Morred/github-search/issues/2", result.first.html_url
      assert_equal "Morred", result.first.user["login"]
      assert_equal "enhancement", result.first.labels.first["name"]
      assert_equal "open", result.first.state
      assert_equal false, result.first.locked 
      assert_equal nil, result.first.assignee
      assert_equal nil, result.first.milestone
      assert_equal 0, result.first.comments
      assert_equal "2015-01-15T14:02:14Z", result.first.created_at
      assert_equal "2015-01-15T14:02:20Z", result.first.updated_at
      assert_equal nil, result.first.closed_at
      assert_equal 10.624432, result.first.score
    end
  end
end