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
MyChessGameTest >> testCapturingPieceInRealGameDetachesIt [
	| game whitePawn blackPawn d4 e5 |
	game := MyChessGame freshGame.
	d4 := game board at: 'd4'.
	e5 := game board at: 'e5'.

	whitePawn := (game board at: 'd2') contents.
	whitePawn moveTo: d4.
	
	blackPawn := (game board at: 'e7') contents.
	blackPawn moveTo: e5.

	self assert: blackPawn square equals: e5.
	whitePawn moveTo: e5.
	
	self assert: e5 contents equals: whitePawn.
	self assert: blackPawn square isNil
]

{ #category : 'tests' }
MyChessGameTest >> testClickingOpponentPieceDoesNotSelectSquare [
	| game blackSquare initialState nextState |
	game := MyChessGame freshGame.
	
	initialState := game board state.
	self assert: initialState class equals: MyUnselectedState.
	
	blackSquare := game board at: 'e7'.
	nextState := initialState clickOn: blackSquare.
	
	self assert: nextState class equals: MyUnselectedState.
	self deny: blackSquare isSelected
]

{ #category : 'tests' }
MyChessGameTest >> testClickingSameSelectedSquareCancelsSelection [
	| game whiteSquare selectedState nextState |
	game := MyChessGame freshGame.
	whiteSquare := game board at: 'e2'.
	
	selectedState := game board state clickOn: whiteSquare.
	self assert: selectedState class equals: MySelectedState.
	self assert: whiteSquare isSelected.
	
	nextState := selectedState clickOn: whiteSquare.
	
	self assert: nextState class equals: MyUnselectedState.
	self deny: whiteSquare isSelected.
	self assert: (game board at: 'e2') contents notNil.
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
