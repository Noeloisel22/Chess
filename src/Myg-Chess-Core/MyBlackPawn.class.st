"
I move down the board and I am promoted when I reach the first rank.
"
Class {
	#name : 'MyBlackPawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'moving' }
MyBlackPawn >> diagonalSquaresFrom: aSquare [
	^ {
		aSquare down ifNotNil: #left.
		aSquare down ifNotNil: #right
	} select: [ :s | s notNil ]
]

{ #category : 'moving' }
MyBlackPawn >> forwardSquareFrom: aSquare [
	^ aSquare down
]

{ #category : 'moving' }
MyBlackPawn >> initialFile [
	^ $7
]

{ #category : 'promotion' }
MyBlackPawn >> promotedTo: aPieceClass [
	^ aPieceClass black
]

{ #category : 'promotion' }
MyBlackPawn >> promotionFile [
	^ $1
]
