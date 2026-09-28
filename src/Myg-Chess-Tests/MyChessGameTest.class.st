Class {
	#name : 'MyChessGameTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessGameTest >> testWhiteStartsAndTurnSwitchesAfterLegalMove [
	| game whitePawn e4 |
	game := MyChessGame freshGame.
	
	"Au début, c'est au joueur blanc de jouer"
	self assert: game currentPlayer isWhite.
	
	"On joue un coup blanc légal : e2 vers e4"
	whitePawn := (game board at: 'e2') contents.
	e4 := game board at: 'e4'.
	game move: whitePawn to: e4.
	
	"le tour passe aux noirs"
	self deny: game currentPlayer isWhite.
]
