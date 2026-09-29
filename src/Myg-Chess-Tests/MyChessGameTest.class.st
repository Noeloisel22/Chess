Class {
	#name : 'MyChessGameTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessGameTest >> testCannotMoveOpponentPiece [
	| game blackPawn e5 |
	game := MyChessGame freshGame.
	
	self assert: game currentPlayer isWhite.
	
	"On tente de déplacer un pion noir"
	blackPawn := (game board at: 'e7') contents.
	e5 := game board at: 'e5'.
	game move: blackPawn to: e5.
	
	"Le pion ne doit pas avoir bougé et le tour doit rester aux Blancs"
	self assert: (game board at: 'e7') contents equals: blackPawn.
	self deny: (game board at: 'e5') hasPiece.
	self assert: game currentPlayer isWhite.
]

{ #category : 'tests' }
MyChessGameTest >> testWhiteStartsAndTurnSwitchesAfterLegalMove [
	| game whitePawn e4 |
	game := MyChessGame freshGame.

	self assert: game currentPlayer isWhite.
	
	"e2 vers e4"
	whitePawn := (game board at: 'e2') contents.
	e4 := game board at: 'e4'.
	game move: whitePawn to: e4.
	
	"le tour passe aux noirs"
	self deny: game currentPlayer isWhite.
]
