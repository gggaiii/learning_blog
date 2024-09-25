# Get the life table as a vector so that lifeTable[j] is
# the number of men who make it to age 10*(j-1)
lifeTable = c(1000, 959, 952, 938, 920, 876, 758, 524, 211, 22, 0) ;

# (1) P( newborn lives to 40)
q1Prob = lifeTable[5] / lifeTable[1]
print( q1Prob )

# (2) P( newborn will die in 20's)
# Begin by computing the number who die in each decade
deathsPerDecade = lifeTable[1:10] - lifeTable[2:11]

# Now compute the probability requested
q2Prob = deathsPerDecade[3] / lifeTable[1]
print( q2Prob )

# (3) P( man lives to 80 | he is 50 )
q3Prob = lifeTable[9] / lifeTable[6]
print( c( q3Prob ) )

# (4) Expected number of points when rolling a weighted die
dieProbs = c(1/10, 1/10, 1/10, 1/10, 1/10, 1/2) ;
oneRollExpectation = 0 ;
for( j in 1:6 ) {
    oneRollExpectation = oneRollExpectation + j*dieProbs[j] ;
}
    
print( oneRollExpectation )
twoRollExpectation = 2 * oneRollExpectation
print( twoRollExpectation )

# (5) P( group of five agriculture students includes two men)
dbinom( 2, 5, 0.2 )
print( 128 / 625 ) # the exact result

# (6) Bayes at a burger joint
pAshaComesIn = 1/2 ;
pBobComesIn = 1/2 ;

pBurgerGivenAsha = 1/5 ;
pBurgerGivenBob = 1 ;

pBurger = (pBurgerGivenAsha * pAshaComesIn) + (pBurgerGivenBob * pBobComesIn) ;

pAshaGivenBurger = (pBurgerGivenAsha * pAshaComesIn) / pBurger ;
pBobGivenBurger = (pBurgerGivenBob * pBobComesIn) / pBurger ;
print( c(pAshaGivenBurger, pBobGivenBurger) )
print( c(1/6, 5/6) )

