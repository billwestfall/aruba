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
        % The Zebra Puzzle.  There are five houses in a row;  each
% house has associated with it a distinct nationality, pet,
% drink, color, and cigarette.  You are given some clues,
% and the goal is to match up everything.  There is a unique
% solution.

% In this representation, the properties are constants.  For example,
% to express the relationship that the Englishman lives in the Red house,
% one would write England=Red.

set(arithmetic).  % We use this for successor relation.

assign(domain_size, 5).  % The five houses are {0,1,2,3,4}.

list(distinct).      % Objects in each list are distinct.

   [England,Spain,Ukraine,Japan,Norway].          % nationalities are distinct
   [Dog,Snail,Horse,Zebra,Fox].                   % pets are distinct
   [Water,Milk,Juice,Tea,Coffee].                 % drinks are distinct
   [Red,Blue,Yellow,Ivory,Green].                 % colors are distinct
   [Lucky,Winston,Kool,Chesterfield,Parlaiment].  % smokes are distinct

end_of_list.

formulas(assumptions). 

% Definitions of successor and neighbors.

   successor(x,y) <-> x+1 = y.
   neighbors(x,y) <-> successor(x,y) | successor(y,x).

% The clues.

   England = Red.                 Lucky = Juice.            
   Spain = Dog.                   Ukraine = Tea.            
   Norway = 0.                    Japan = Parlaiment.            
   Kool = Yellow.                 neighbors(Kool,Horse).  
   neighbors(Chesterfield,Fox).   Coffee = Green.            
   neighbors(Norway,Blue).        successor(Green,Ivory). 
   Winston = Snail.               Milk = 2.               

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
