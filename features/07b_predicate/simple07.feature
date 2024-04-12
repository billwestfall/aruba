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

op(400, infix_right, *).  % right association assumed for *
set(restrict_denials).    % gives a more direct proof


assign(max_weight, 35).

formulas(sos).

(x * y) * z = x * y * z # label(associativity).

% NOTE: the "extended" versions of cancellation usually work better.

% x * y != x * z | y = z # label(left_cancellation).
% y * x != z * x | y = z # label(right_cancellation).

x * y != u | x * z != u | y = z # label(left_cancellation_extended).
y * x != u | z * x != u | y = z # label(right_cancellation_extended).

% A well-known theorem in CS says that a cancellation semigroup  
% satisfying a non-trivial identity must satisfy the Ore's quotient  
% condition.

% Five examples.

% x * y = y * x # label(commutativity).
  x * y * z * y * x = y * x * z * x * y # label(nilpotent_class2).
% x * y * x * y * x * y = x * x * x * y * y * y # label("(xy)^3 = x^3y^3").
% x * y * x * y * x * y = y * x * y * x * y * x # label("(xy)^3 = (yx)^3").
% x * f(x,y) * y = y * g(x,y) * x # label(general_case).

% Denial of Ore's quotient condition:

b * b0 = a * a0.
d * b0 = c * a0.
b * d0 = a * c0.
d * d0 != c * c0.

end_of_list.



        \"\"\"
        When I successfully run `prover9 -f ./ba4.in`
        Then the output should contain:
        \"\"\"
        Model 1
        \"\"\"
    """
    When I successfully run `cucumber`
    Then the features should all pass
