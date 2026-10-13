"
I move up the board and I am promoted when I reach the last rank.
"
Class {
	#name : 'MyWhitePawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'moving' }
MyWhitePawn >> diagonalSquaresFrom: aSquare [
	^ {
		aSquare up ifNotNil: #left.
		aSquare up ifNotNil: #right
	} select: [ :s | s notNil ]
]

{ #category : 'moving' }
MyWhitePawn >> forwardSquareFrom: aSquare [
	^ aSquare up
]

{ #category : 'moving' }
MyWhitePawn >> initialFile [
	^ $2
]

{ #category : 'moving' }
MyWhitePawn >> promotedTo: aPieceClass [
	^ aPieceClass white
]

{ #category : 'moving' }
MyWhitePawn >> promotionFile [
	^ $8
]
