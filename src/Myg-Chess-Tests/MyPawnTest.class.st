Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testBlackPawnInitialMoveAllowsTwoSquares [
	| board pawn targets |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn black).

	targets := pawn targetSquares.

	self assert: (targets includes: (board at: 'e6')).
	self assert: (targets includes: (board at: 'e5')).
	self assert: targets size equals: 2
]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnPromotesToQueenOnFirstRank [
	| board pawn |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn black).
	pawn moveTo: (board at: 'e1').
	self assert: (board at: 'e1') contents class equals: MyQueen.
	self deny: (board at: 'e1') contents isWhite
]

{ #category : 'tests' }
MyPawnTest >> testPawnAttacksDiagonalsEvenIfEmpty [
	| board pawn attacks |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).

	attacks := pawn attackingSquares.

	"Un pion blanc en e4 contrôle d5 et f5, même sans ennemi dessus"
	self assert: (attacks includes: (board at: 'd5')).
	self assert: (attacks includes: (board at: 'f5')).
	self assert: attacks size equals: 2
]

{ #category : 'tests' }
MyPawnTest >> testPawnCanCaptureDiagonallyOpponentPiece [
	| board pawn targets |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: MyPawn black. "Adversaire en diagonale"

	targets := pawn targetSquares.

	self assert: (targets includes: (board at: 'd5'))
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotCaptureDiagonallyEmptySquare [
	| board pawn targets |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).

	targets := pawn targetSquares.

	self deny: (targets includes: (board at: 'd5'))
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotCaptureSameColorPieceDiagonally [
	| board pawn targets |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: MyPawn white.

	targets := pawn targetSquares.

	self deny: (targets includes: (board at: 'd5'))
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotMoveForwardIfBlocked [
	| board pawn targets |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).
	board at: 'e3' put: MyPawn black.

	targets := pawn targetSquares.

	self deny: (targets includes: (board at: 'e3')).
	self deny: (targets includes: (board at: 'e4'))
]

{ #category : 'tests' }
MyPawnTest >> testPawnDoesNotAttackForwardSquare [
	| board pawn attacks |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).

	attacks := pawn attackingSquares.

	self deny: (attacks includes: (board at: 'e5'))
]

{ #category : 'tests' }
MyPawnTest >> testPawnDoesNotPromoteBeforeLastRank [
	| board pawn |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).
	pawn moveTo: (board at: 'e3').
	self assert: ((board at: 'e3') contents isKindOf: MyPawn)
]

{ #category : 'tests' }
MyPawnTest >> testPawnPromotesToChosenPiece [
	| board pawn |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn white).
	pawn promotionPieceClass: MyKnight.
	pawn moveTo: (board at: 'e8').
	self assert: (board at: 'e8') contents class equals: MyKnight
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnInitialMoveAllowsTwoSquares [
	| board pawn targets |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	targets := pawn targetSquares.

	self assert: (targets includes: (board at: 'e3')).
	self assert: (targets includes: (board at: 'e4')).
	self assert: targets size equals: 2
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnPromotesToQueenOnLastRank [
	| board pawn |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn white).
	pawn moveTo: (board at: 'e8').
	self assert: (board at: 'e8') contents class equals: MyQueen.
	self assert: (board at: 'e8') contents isWhite
]
