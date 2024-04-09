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

        %
        %  Combinatory Logic
        %  Construct W in terms of S and K.  Wxy = xyy.
        %

        formulas(sos).

        a(a(a(S,x),y),z) = a(a(x,z),a(y,z)) # label(S).
        a(a(K,x),y) = x # label(K).

        end_of_list.

        % Don't set(restrict_denials), because the easy proofs
        % paramodulate into the denial.

        formulas(goals).

        (exists W all x all y (a(a(W,x),y) = a(a(x,y),y))) # label(W).

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
