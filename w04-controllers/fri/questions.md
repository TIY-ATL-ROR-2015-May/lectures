# github-stats

## Description

Pull and aggregate commit statistics from Github


## Objectives

### Learning Objectives

After completing this assignment, you should…

* Be able to make HTTP requests from Ruby
* Be able to iterate through the nested JSON responses that most APIs will return


### Performance Objectives

After completing this assignment, you be able to effectively use

* HTTParty (or similar) for making requests
* Parsed JSON responses


## Details

### Deliverables

* A script `github-stats.rb`

### Requirements

Running `ruby github-stats.rb` should:

* Prompt the user for an auth token (falling back public if none given)
* Prompt the user for a github organization to report on
* Produce a table of contributions

## Normal Mode

Get the list of all members in that organization, and then aggregate the `addition`, `deletion` and `change` counts (as returned from the [contributors endpoint](https://developer.github.com/v3/repos/statistics/#contributors)) for _all_ public repositories for each user (note: not just contributions to repos for the organization).

The script should produce a table something like

```
              Additions     Deletions     Changes
User 1            13534          2954        6249
User 2             6940           913        1603
...
```

(or may produce a CSV output).

## Hard Mode

* Save data locally so that repeated runs of the script don't need to fetch all the stats each time
* Allow the user to specify a time frame and only report on commits in that time frame
