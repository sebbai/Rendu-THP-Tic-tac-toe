# Rendu-THP-Tic-tac-toe


Deux joueurs s'affrontent. Ils doivent remplir chacun à leur tour une case de la grille avec le symbole qui leur est attribué : O ou X.
Le gagnant est celui qui arrive à aligner trois symboles identiques, horizontalement, verticalement ou en diagonale.

Une partie gagnée par le joueur X :
-------------
| X | X | X |
-------------
| O | '' | '' |
-------------
| O | '' | '' |
-------------

victoire du joueur X

Une partie nulle :
-------------
| X | O | X |
-------------
| X | O | O |
-------------
| O | X | X |
-------------

Personne ne parvient à créer un alignement.

En raison du nombre de combinaisons limité, l'analyse complète du jeu est facile à réaliser : si les deux joueurs jouent chacun de manière
optimale, la partie doit toujours se terminer par un match nul.
