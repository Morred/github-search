require './test/test_helper'

class IssueTest < Minitest::Test
  def test_exists
    assert GithubSearch::Issue
  end

  def test_returns_issues

    VCR.use_cassette('repository_issues') do
      result = GithubSearch::Issue.search("test", "issue", repo: "Morred/github-search", label: "enhancement")
      puts result.inspect
      assert_equal Array, result.class
      assert_equal GithubSearch::Issue, result.first.class

      # Check that the fields are accessible by our model
      # assert_equal 68, car.id
      # assert_equal "Honda", car.make
      # assert_equal "Civic", car.model
      # assert_equal "1996", car.year
      # assert_equal "Blue", car.color
      # assert_equal "XXXXXXXXXXXXXX", car.vin
      # assert_equal 34, car.dealer_id
    end
  end
end