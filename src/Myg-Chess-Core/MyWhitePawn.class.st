Class {
	#name : 'MyWhitePawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyWhitePawn >> diagonalSquaresFrom: aSquare [
	^ {
		aSquare up ifNotNil: #left.
		aSquare up ifNotNil: #right
	} select: [ :s | s notNil ]
]

{ #category : 'as yet unclassified' }
MyWhitePawn >> forwardSquareFrom: aSquare [
	^ aSquare up
]

{ #category : 'as yet unclassified' }
MyWhitePawn >> initialFile [
	^ $2
]
