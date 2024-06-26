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

% This problem, from the TPTP, has something to do with hardware verification.

set(prolog_style_variables).

formulas(sos).

-p9(X1,c16) | p1(f12(c5,f19(X1)),f11(c13,f17(X1))).
-p2(f12(c5,X1),c4) | -p9(X1,c15) | p2(f11(c5,X1),c5) | -p6(X1,c7).
p1(f12(c22,X1),f12(c5,f18(X1))) | -p9(X1,c16).
p9(f25(X1),c16) | -p9(X1,c23).
-p3(c4,c5).
-p9(X1,c16) | p1(f12(c5,f18(X1)),f11(c5,f19(X1))).
p1(f12(c21,X1),f12(c5,f17(X1))) | -p9(X1,c16).
-p9(X1,c23) | p1(f11(c5,X1),f11(c5,f25(X1))).
-p6(X2,c7) | -p2(f11(X1,X2),c5) | -p9(X2,c14) | p2(f12(c5,X2),c5).
-p2(f12(c5,X1),c4) | -p9(X1,c14) | p2(f11(c5,X1),c4) | -p6(X1,c7).
p2(f11(c13,X1),c4) | -p2(f12(c5,X1),c4) | p2(f11(c5,X1),c4) | -p6(X1,c7) | -p9(X1,c10).
p1(f12(c21,X1),f12(c21,f25(X1))) | -p9(X1,c23).
p6(X2,c7) | -p9(X2,X1) | p6(X2,c8).
-p1(X1,X2) | p2(X2,X3) | -p2(X1,X3).
-p6(X1,c8) | -p6(X1,c7).
p2(X2,X3) | -p1(X2,X1) | -p2(X1,X3).
-p9(X1,c16) | p9(f19(X1),c15).
p2(f11(c5,X1),c5) | -p2(f12(c5,X1),c5) | -p6(X1,c7) | p2(f11(c13,X1),c5) | -p9(X1,c14).
p2(f12(c5,X1),c5) | -p9(X1,c10) | -p6(X1,c7) | -p2(f11(c5,X1),c5) | -p2(f11(c13,X1),c5).
p1(f11(c5,X1),f11(c5,f20(X1))) | -p9(X1,c16).
p9(f24(X1),c16) | -p9(X1,c23).
-p9(X1,c16) | p1(f12(c5,f20(X1)),f11(c5,f17(X1))).
p1(f12(c21,f24(X1)),f11(c13,f25(X1))) | -p9(X1,c23).
p1(f11(c13,X1),f11(c5,f24(X1))) | -p9(X1,c23).
p1(f12(c22,f24(X1)),f11(c13,f20(X1))) | -p9(X1,c23).
-p9(X1,c10) | -p2(f12(c5,X1),c5) | -p6(X1,c7) | p2(f11(c5,X1),c5).
p1(f12(c22,X1),f12(c5,f20(X1))) | -p9(X1,c23).
-p3(c5,c4).
-p6(X1,c7) | -p9(X1,c10) | -p2(f12(c5,X1),c5) | p2(f11(c13,X1),c5).
-p2(f12(c5,X1),c4) | p2(f11(c13,X1),c4) | -p6(X1,c7) | -p9(X1,c14).
p2(f11(c5,X1),c4) | -p2(f12(c5,X1),c5) | -p6(X1,c7) | -p9(X1,c15).
-p9(X1,c16) | p1(f11(c13,X1),f11(c13,f20(X1))).
-p2(f11(c13,X1),c4) | -p9(X1,c14) | p2(f12(c5,X1),c4) | -p2(f11(c5,X1),c4) | -p6(X1,c7).
p1(f11(c5,X1),f11(c5,f18(X1))) | -p9(X1,c16).
p9(f17(X1),c10) | -p9(X1,c16).
p1(f11(c22,X1),f11(c13,f24(X1))) | -p9(X1,c23).
-p9(X1,c16) | p1(f11(c13,X1),f11(c13,f18(X1))).
p3(X2,X3) | -p2(X1,X3) | -p2(X1,X2).
-p9(X1,c23) | p9(f20(X1),c14).
p2(f12(c5,X2),c4) | -p9(X2,c10) | -p2(f11(X1,X2),c4) | -p6(X2,c7).
-p9(X1,c23) | p1(f12(c22,f25(X1)),f11(c5,f20(X1))).
p2(f12(c5,X1),c5) | -p6(X1,c7) | -p9(X1,c15) | -p2(f11(c5,X1),c4).
p9(f20(X1),c14) | -p9(X1,c16).
-p2(f11(c5,X1),c5) | p2(f12(c5,X1),c4) | -p9(X1,c15) | -p6(X1,c7).
p9(f18(X1),c10) | -p9(X1,c16).

-p6(f19(f24(c26)),c8).
-p6(f17(f24(c26)),c8).
-p6(f18(f25(c26)),c8).
-p6(f18(f24(c26)),c8).
-p6(f17(f25(c26)),c8) | -p6(f20(c26),c8).
p2(f12(c21,c26),c5).
p2(f11(c13,c26),c4).
p2(f11(c22,c26),c5).
p2(f11(c5,c26),c5).
-p6(f20(f24(c26)),c8).
p9(c26,c23).
-p6(f19(f25(c26)),c8) | -p6(f20(c26),c8).
p2(f12(c22,c26),c4).

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
