# GithubSearch 
[![Build Status](https://travis-ci.org/Morred/github-search.svg?branch=master)](https://travis-ci.org/Morred/github-search) [![Code Climate](https://codeclimate.com/github/Morred/github-search/badges/gpa.svg)](https://codeclimate.com/github/Morred/github-search)

A wrapper gem for the Github Search API.

See the official documentation for the Github Search API here: https://developer.github.com/v3/search/

## Searching

Instantiate a new searcher, then use it to search, like so:

```ruby
github = GithubSearch::Searcher.new

result = github.issues.search("test", "issue", repo: "Morred/github-search", label: "enhancement")
```

You can currently search issues, repositories and users.

## Searching Issues

Example:
```ruby
result = github.issues.search("test", "foo", repo: "Morred/github-search", language: "Ruby")
```

Search for any number of keywords as strings (such as "test" and "foo" in the above example) as well as search qualifiers (such as repo and language in the above example).

###Currently supported issue search qualifiers are:

**assignee**  
Finds issues or pull requests that are assigned to a certain user.  
**author**  
Finds issues or pull requests created by a certain user.  
**closed**  
Filters issues or pull requests based on the date when they were closed.  
*Values: e.g. >2014-12-25, <=2015-01-17, 2019-02-03*  
**commenter**  
Finds issues or pull requests that a certain user commented on.  
**comments**  
Filters issues or pull requests based on the quantity of comments.  
*Values: e.g. >500, 50..100*  
**created**  
Filters issues or pull requests based on date of creation.  
*Values: e.g. >2014-12-25, <=2015-01-17, 2019-02-03*  
**in**  
Qualifies which fields are searched. With this qualifier you can restrict the search to just the title, body, comments, or any combination of these.  
*Values: title, body, comment*  
**involves**  
Finds issues or pull requests that were either created by a certain user, assigned to that user, mention that user, or were commented on by that user.  
**is**  
Searches for items within repositories that match a certain state, such as open, closed, or merged.  
*Values: open, closed, unmerged, merged, pr, issue*  
**labels**  
Filters issues or pull requests based on their labels.  
**language**  
Searches for issues or pull requests within repositories that match a certain language.  
**mentions**  
Finds issues or pull requests that mention a certain user.  
**merged**  
Filters pull requests based on the date when they were merged.  
*Values: e.g. >2014-12-25, <=2015-01-17, 2019-02-03*  
**no**  
Filters items missing certain metadata, such as label, milestone, or assignee.  
*Values: label, milestone, assignee*  
**repo**  
Limits searches to a specific repository.  
**state**  
Filter issues or pull requests based on whether they’re open or closed.  
*Values: open, closed*  
**team**  
For organizations you’re a member of, finds issues or pull requests that @mention a team within the organization.  
**type**  
With this qualifier you can restrict the search to issues or pull request only.  
*Values: pr, issue*  
**updated**  
Filters issues or pull requests based on when they were last updated.  
*Values: e.g. >2014-12-25, <=2015-01-17, 2019-02-03*  
**user**  
Limits searches to a specific user.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'github-search'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install github-search

## Contributing

1. Fork it ( https://github.com/Morred/github-search/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
