Class {
	#name : 'MyUnselectedState',
	#superclass : 'Object',
	#instVars : [
		'board'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyUnselectedState class >> board: aBoard [

	^ self new
		  board: aBoard;
		  yourself
]

{ #category : 'accessing' }
MyUnselectedState >> board [

	^ board
]

{ #category : 'accessing' }
MyUnselectedState >> board: anObject [

	board := anObject
]

{ #category : 'events' }
MyUnselectedState >> clickOn: aMyChessSquare [
	| piece |
	aMyChessSquare hasPiece ifFalse: [ ^ self ].
	
	piece := aMyChessSquare contents.
	piece color = board game currentPlayer color ifFalse: [ ^ self ].

	aMyChessSquare select.
	board highLightTargets: piece legalTargetSquares.
	^ MySelectedState board: board selected: aMyChessSquare
]
