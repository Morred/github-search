# GithubSearch 
[![Build Status](https://travis-ci.org/Morred/github-search.svg?branch=master)](https://travis-ci.org/Morred/github-search) [![Code Climate](https://codeclimate.com/github/Morred/github-search/badges/gpa.svg)](https://codeclimate.com/github/Morred/github-search)

A wrapper gem for the Github Search API.

See the official documentation for the Github Search API here: [https://developer.github.com/v3/search/]

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
result = github.issues.search("test", "issue", repo: "Morred/github-search", language: "Ruby")
```

Currently supported issue search qualifiers are:

**type**  
With this qualifier you can restrict the search to issues or pull request only.  
*Values: pr, issue*  
**in**  
Qualifies which fields are searched. With this qualifier you can restrict the search to just the title, body, comments, or any combination of these.  
*Values: title, body, comment*  
**author**  
Finds issues or pull requests created by a certain user.  
**assignee**  
Finds issues or pull requests that are assigned to a certain user.  
**mentions**  
Finds issues or pull requests that mention a certain user.  
**commenter**  
Finds issues or pull requests that a certain user commented on.  
**involves**  
Finds issues or pull requests that were either created by a certain user, assigned to that user, mention that user, or were commented on by that user.  
**team**  
For organizations you’re a member of, finds issues or pull requests that @mention a team within the organization.  
**state**  
Filter issues or pull requests based on whether they’re open or closed.  
*Values: open, closed*  
**labels**  
Filters issues or pull requests based on their labels.  
**no**  
Filters items missing certain metadata, such as label, milestone, or assignee.  
*Values: label, milestone, assignee*  
**language**  
Searches for issues or pull requests within repositories that match a certain language.  
**is**  
Searches for items within repositories that match a certain state, such as open, closed, or merged.  
*Values: open, closed, unmerged, merged, pr, issue*  
**created** or **updated**  
Filters issues or pull requests based on date of creation, or when they were last updated.  
*Values: e.g. >2014-12-25, <=2015-01-17, 2019-02-03*  
**merged**  
Filters pull requests based on the date when they were merged.  
*Values: e.g. >2014-12-25, <=2015-01-17, 2019-02-03*  
**closed**  
Filters issues or pull requests based on the date when they were closed.  
*Values: e.g. >2014-12-25, <=2015-01-17, 2019-02-03*  
**comments**  
Filters issues or pull requests based on the quantity of comments.  
*Values: e.g. >500, 50..100*  
**user** or **repo**  
Limits searches to a specific user or repository.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'github-search'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install github-search

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/Morred/github-search/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
