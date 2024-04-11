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
       
        % Noncommutative group of size 48.  This is found in about a second.
% Size 48 is usually way out of range for MACE4, and I don't know
% why this one is so fast.  In general, sizes 6 * 2^n are very fast.

assign(domain_size, 48).

clear(negprop).  % This reduces the time from 3 seconds to 1.

set(verbose).

clauses(theory).

e * x = x.
x' * x = e.
(x * y) * z = x * (y * z).

A * B != B * A.

end_of_list.

        \"\"\"
        When I successfully run `mace4 -f ./BA4.in`
        Then the output should contain:
        \"\"\"
        THEOREM PROVED
        \"\"\"
    """
    When I successfully run `cucumber`
    Then the features should all pass
