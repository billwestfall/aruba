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
        assign(iterate_up_to, 12).

set(verbose).

% This list of formulas specifies a noncommutative group.
%
% Normally we would write the group axioms with clauses
% (as in the example ncg-48.in).  Here we use quantified
% formulas.

formulas(theory).

% Associativity

all x all y all z ((x * y) * z = x * (y * z)).

% There is a left identity element, and every element has a left inverse.

exists e ((all x (e * x = x)) &
          (all x exists y (y * x = e))).

% So far, we have group theory.  Now, state that
% there are two noncommuting elements.

exists a exists b (a * b != b * a).

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
