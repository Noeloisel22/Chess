Class {
	#name : 'MyBlackPawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyBlackPawn >> diagonalSquaresFrom: aSquare [
	^ {
		aSquare down ifNotNil: #left.
		aSquare down ifNotNil: #right
	} select: [ :s | s notNil ]
]

{ #category : 'as yet unclassified' }
MyBlackPawn >> forwardSquareFrom: aSquare [
	^ aSquare down
]

{ #category : 'as yet unclassified' }
MyBlackPawn >> initialFile [
	^ $7
]
