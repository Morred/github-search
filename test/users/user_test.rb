require './test/test_helper'

class UserTest < Minitest::Test
  def test_exists
    assert GithubSearch::User
  end

  def test_returns_users
    VCR.use_cassette('search_users') do
      result = GithubSearch::User.search("morred", type: "User")

      assert_equal Array, result.class
      assert_equal 3, result.length
      assert_equal GithubSearch::User, result.first.class

      # Check that the fields are accessible by our model
      assert_equal 4008608, result.first.id
      assert_equal "Morred", result.first.login
      assert_equal "https://avatars.githubusercontent.com/u/4008608?v=3", result.first.avatar_url
      assert_equal "", result.first.gravatar_id
      assert_equal "https://api.github.com/users/Morred", result.first.url
      assert_equal "https://github.com/Morred", result.first.html_url
      assert_equal "https://api.github.com/users/Morred/followers", result.first.followers_url
      assert_equal "https://api.github.com/users/Morred/following{/other_user}", result.first.following_url
      assert_equal "https://api.github.com/users/Morred/gists{/gist_id}", result.first.gists_url
      assert_equal "https://api.github.com/users/Morred/starred{/owner}{/repo}", result.first.starred_url
      assert_equal "https://api.github.com/users/Morred/subscriptions", result.first.subscriptions_url
      assert_equal "https://api.github.com/users/Morred/orgs", result.first.organizations_url
      assert_equal "https://api.github.com/users/Morred/repos", result.first.repos_url
      assert_equal "https://api.github.com/users/Morred/events{/privacy}", result.first.events_url
      assert_equal "https://api.github.com/users/Morred/received_events", result.first.received_events_url
      assert_equal "User", result.first.type
      assert_equal false, result.first.site_admin
      assert_equal 61.729008, result.first.score
    end
  end
end