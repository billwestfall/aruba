Feature: Run commands with Aruba

  As long as you've got the neccessary programs, libraries, runtime
  environments, interpreters installed, it doesn't matter in which programming
  language your command line application is implemented. You can also run any
  program that is in your $PATH.

  Background:
    Given I use a fixture named "getting-started-app"

  @requires-ruby
  Scenario: Ruby Program via "ruby"
    Given a file named "features/hello_aruba.feature" with:
    """
    Feature: Run curl against Wolfram API
      Scenario: First Run of Command
        Given a file named "cli.rb" with:
        \"\"\"
        require 'net/http'
        require 'uri'

        uri = URI.parse("https://newton.vercel.app/api/v2/sin/0.5")
        response = Net::HTTP.get_response(uri)

        puts response.code
        STDOUT.puts response.body

        \"\"\"
        When I successfully run `ruby ./cli.rb`
        Then the output should contain:
        \"\"\"
        0.479426
        \"\"\"
    """
    When I successfully run `cucumber`
    Then the features should all pass
