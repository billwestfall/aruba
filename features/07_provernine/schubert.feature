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
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                Schubert's Steamroller
% 
% Wolves, foxes, birds, caterpillars, and snails are animals,
% and there are some of each of them.
% 
% Also there are some grains, and grains are plants.
% 
% Every animal either likes to eat all plants or all animals much
% smaller than itself that like to eat some plants.
% 
% Caterpillars and snails are much smaller than birds, which are much
% smaller than foxes, which are in turn much smaller than wolves.
% 
% Wolves do not like to eat foxes or grains, while birds like to eat
% caterpillars but not snails.
% 
% Caterpillars and snails like to eat some plants.
% 
% Prove there is an animal that likes to eat a grain-eating animal.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

assign(max_seconds, 30).

formulas(assumptions).

Wolf(x) -> animal(x).
Fox(x) -> animal(x).
Bird(x) -> animal(x).
Caterpillar(x) -> animal(x).
Snail(x) -> animal(x).
Grain(x) -> plant(x).

exists x Wolf(x).
exists x Fox(x).
exists x Bird(x).
exists x Caterpillar(x).
exists x Snail(x).
exists x Grain(x).

% All animals either eat all plants or eat all smaller animals that eat some plants.

all x (animal(x) -> (all y (plant(y)->eats(x,y)))
                    | 
                    (all z ( animal(z) &
                             Smaller(z,x) &
                             (exists u (plant(u) & eats(z,u)))
                            ->
                             eats(x,z)))).

Caterpillar(x) & Bird(y) -> Smaller(x,y).
Snail(x) & Bird(y) -> Smaller(x,y).
Bird(x) & Fox(y) -> Smaller(x,y).
Fox(x) & Wolf(y) -> Smaller(x,y).
Bird(x) & Caterpillar(y) -> eats(x,y).

Caterpillar(x) -> (exists y (plant(y) & eats(x,y))).
Snail(x)       -> (exists y (plant(y) & eats(x,y))).

Wolf(x) & Fox(y) -> -eats(x,y).
Wolf(x) & Grain(y) -> -eats(x,y).
Bird(x) & Snail(y) -> -eats(x,y).

end_of_list.

formulas(goals).

% There is an animal that eats {an animal that eats all grains}.

exists x exists y ( animal(x) &
	            animal(y) &
	            eats(x,y) &
                    (all z (Grain(z) -> eats(y,z)))).
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
