require './test/test_helper'

class RepositoryTest < Minitest::Test
  def test_exists
    assert GithubSearch::Repository
  end
end