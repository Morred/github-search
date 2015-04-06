# GithubSearch
[![Build Status](https://travis-ci.org/Morred/github-search.svg?branch=master)](https://travis-ci.org/Morred/github-search) [![Code Climate](https://codeclimate.com/github/Morred/github-search/badges/gpa.svg)](https://codeclimate.com/github/Morred/github-search)

A wrapper gem for the Github Search API.

### General info
+ The GitHub Search API provides up to 1,000 results for each search.
+ The Github Search API has a custom rate limit. For requests using Basic Authentication, OAuth, or client ID and secret, you can make up to 20 requests per minute. For unauthenticated requests, the rate limit allows you to make up to 5 requests per minute.
+ For queries that exceed the time limit, the API returns the matches that were already found prior to the timeout, and the response has the incomplete_results property set to true.

See the official documentation for the Github Search API here: https://developer.github.com/v3/search/

## Table of Contents
1. [Searching](https://github.com/Morred/github-search#searching)
  + [Searching Issues](https://github.com/Morred/github-search#searching-issues)
  + [Searching Repositories](https://github.com/Morred/github-search#searching-repositories)
  + [Searching Users](https://github.com/Morred/github-search#searching-users)
2. [Sorting and Ordering](https://github.com/Morred/github-search#sorting-and-ordering)
  + [Sorting Issues](https://github.com/Morred/github-search#sorting-issues)
  + [Sorting Repositories](https://github.com/Morred/github-search#sorting-repositories)
  + [Sorting Users](https://github.com/Morred/github-search#sorting-users)
  + [Ordering](https://github.com/Morred/github-search#ordering)
3. [Installation](https://github.com/Morred/github-search#installation)

## Searching

Instantiate a new searcher, then use it to search, like so:

```ruby
github = GithubSearch::Searcher.new

result = github.issues.search("test", "issue", repo: "Morred/github-search", label: "enhancement")
```

You can currently search issues, repositories and users.

### Searching Issues

Example:
```ruby
result = github.issues.search("test", "foo", repo: "Morred/github-search", language: "Ruby")
```

Search for any number of keywords as strings (such as "test" and "foo" in the above example) as well as search qualifiers (such as repo and language in the above example).

#### Currently supported issue search qualifiers are:

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
**involves**  
Finds issues or pull requests that were either created by a certain user, assigned to that user, mention that user, or were commented on by that user.  
**is**  
Searches for items within repositories that match a certain state, such as open, closed, or merged.  
*Values: open, closed, unmerged, merged, pr, issue*  
**labels**  
Filters issues or pull requests based on their labels.  
**language**  
Searches for issues or pull requests within repositories that match a certain language.  
*Values: e.g. Ruby, C++, Swift*  
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

### Searching Repositories

Example:
```ruby
result = github.repositories.search("foo", user: "Morred", language: "Ruby")
```

Search for any number of keywords as strings (such as "foo" in the above example) as well as search qualifiers (such as user and language in the above example).

#### Currently supported repository search qualifiers are:

**created**
Filters repositories based on date of creation.  
*Values: e.g. >2014-12-25, <=2015-01-17, 2019-02-03*  
**forks**  
Filters repositories based on the number of forks, and/or whether forked repositories should be included in the results at all.  
**in**  
Qualifies which fields are searched. With this qualifier you can restrict the search to just the repository name, description, readme, or any combination of these.
*Values: name, description, readme*  
**language**  
Searches repositories based on the language they’re written in.  
*Values: e.g. Ruby, C++, Swift*  
**pushed**  
Filters repositories based on when they were last updated.  
*Values: e.g. >2014-12-25, <=2015-01-17, 2019-02-03*  
**size**  
Finds repositories that match a certain size (in kilobytes).  
**stars**  
Searches repositories based on the number of stars.  
**user**  
Limits searches to a specific user.  

### Searching Users

Example:
```ruby
result = github.users.search("morred", repos: ">10", language: "Ruby")
```

Search for any number of keywords as strings (such as "morred" in the above example) as well as search qualifiers (such as repos and language in the above example).

#### Currently supported user search qualifiers are:

**created**  
Filter users based on when they joined.  
*Values: e.g. >2014-12-25, <=2015-01-17, 2019-02-03*  

**followers**  
Filter users based on the number of followers they have.  
**in**  
Qualifies which fields are searched. With this qualifier you can restrict the search to just the username, public email, full name, or any combination of these.  
**language**  
Search for users that have repositories that match a certain language.  
*Values: e.g. Ruby, C++, Swift*  
**location**  
Filter users by the location indicated in their profile.  
*Values: e.g. Germany, Tokyo*  
**repos**  
Filters users based on the number of repositories they have.
*Values: e.g. 20, >10, <100*  
**type**  
With this qualifier you can restrict the search to just personal accounts or just organization accounts.  
*Values: User, Organization*  

## Sorting and Ordering

Example:
```ruby
result = github.repositories.search("test", user: "Morred", sort: :stars, order: :asc)
```

**By default, all results are sorted by best match. The default order is descending.**

### Sorting Issues

Issues can be sorted by:

**comments**  
Issues are sorted by comments count.

**created**  
Issues are sorted by their created_at date.

**updated**  
Issues are sorted by their updated_at date.

### Sorting Repositories

Repositories can be sorted by:

**stars**  
Repositories are sorted by stars count.

**forks**  
Repositories are sorted by forks count.

**updated**  
Somewhat counterintuitively, repositories are *not* sorted by updated_at, but instead by pushed_at.

### Sorting Users

Users can be sorted by:

**followers**  
Users are sorted by followers count.

**repositories**  
Users are sorted by repositories count.

**joined**  
Users are sorted by their joined_at date.

### Ordering

You can only order your search results when a sort parameter is provided.

**asc**  
Ascending order.

**desc**  
Descending order.

The default order is descending. 

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
