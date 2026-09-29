Class {
	#name : 'MyChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTest >> testEmptyContentsRemovesPiece [
	| square |
	square := MyChessSquare white.
	square board: MyChessBoard empty.
	square contents: MyKnight white.
	square emptyContents.
	self deny: square hasPiece
]

{ #category : 'tests' }
MyChessSquareTest >> testNewSquareHasNoPiece [
	| square |
	square := MyChessSquare white.
	self deny: square hasPiece
]

{ #category : 'tests' }
MyChessSquareTest >> testSquareWithPieceHasPiece [
	| square |
	square := MyChessSquare white.
	square board: MyChessBoard empty.
	square contents: MyKnight white.
	self assert: square hasPiece
]
