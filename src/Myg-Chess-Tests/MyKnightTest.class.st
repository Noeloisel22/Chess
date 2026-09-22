Class {
	#name : 'MyKnightTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKnightTest >> testRenderPieceOnWhiteSquare [
	| whiteKnight blackKnight whiteSquare blackSquare |
	whiteKnight := MyKnight white.
	blackKnight := MyKnight black.
	whiteSquare := MyChessSquare white.
	blackSquare := MyChessSquare black.

	self assert: (whiteKnight renderPieceOn: whiteSquare) equals: 'N'.
	self assert: (whiteKnight renderPieceOn: blackSquare) equals: 'n'.
	self assert: (blackKnight renderPieceOn: whiteSquare) equals: 'M'.
	self assert: (blackKnight renderPieceOn: blackSquare) equals: 'm'.
]
