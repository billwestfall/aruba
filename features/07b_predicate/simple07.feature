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
    Feature: Getting Started With Aruba
      Scenario: First Run of Command
        Given a file named "ba4.in" with:
        \"\"\"
       
        assign(iterate_up_to, 10). % search up through order 10
clauses(theory).
E * x = x. % left identity
x’ * x = E. % left inverse
(x * y) * z = x * (y * z). % associativity
A * B != B * A. % A and B do not commute
end_of_list.

        \"\"\"
        When I successfully run `mace4 -f ./ba4.in`
        Then the output should contain:
        \"\"\"
        THEOREM PROVED
        \"\"\"
    """
    When I successfully run `cucumber`
    Then the features should all pass
