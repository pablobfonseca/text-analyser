## Ruby Text Analyser
[![Code
Climate](https://codeclimate.com/github/pablobfonseca/text-analyser/badges/gpa.svg)](https://codeclimate.com/github/pablobfonseca/text-analyser)
[![Build
Status](https://travis-ci.org/pablobfonseca/text-analyser.svg?branch=master)](https://travis-ci.org/pablobfonseca/text-analyser)


This is a pretty simple text analyser written in Ruby.

## Usage
Just pass a file as a parameter to the analyser
```sh
./analyser <path/to/file>
```

In case you get permission error, just run:
```sh
chmod +x analyser
```

## Demo
```
==============================
Report
==============================
127 lines
6376 characters
5140 characters excluding spaces
1111 words
20 paragraphs
45 sentences
2 sentences per paragraph (average)
24 words per sentence (average)
==============================
```

## Running the tests
It uses [minitest](https://github.com/seattlerb/minitest) to run the tests.
There is a rake task to run all tests, just type:
```ruby
rake
```
