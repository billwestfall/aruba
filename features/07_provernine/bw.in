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
        assign(max_seconds, 30).

        assign(order, kbo).  % It works with the default (lpo) but it takes longer.

        formulas(assumptions).

        % combinators B and W

        a(a(a(B,x),y),z) = a(x,a(y,z)) # label(B).
        a(a(W,x),y) = a(a(x,y),y) # label(W).

        end_of_list.

        formulas(goals).

        % existence of a fixed point combinator

        (exists Q all x (a(Q,x) = a(x,a(Q,x)))) # label(fixed_point_combinator).

        end_of_list.

        \"\"\"
        When I successfully run `prover9 -f ./BA4.in`
        Then the output should contain:
        \"\"\"
        THEOREM PROVED
        \"\"\"
    """
    When I successfully run `cucumber`
    Then the features should all pass
