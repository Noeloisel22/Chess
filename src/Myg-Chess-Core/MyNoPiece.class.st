Class {
	#name : 'MyNoPiece',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyNoPiece >> color [
	^ nil
]

{ #category : 'testing' }
MyNoPiece >> hasPiece [
	^ false
]

{ #category : 'testing' }
MyNoPiece >> isPresent [
	^ false
]

{ #category : 'testing' }
MyNoPiece >> legalTargetSquares [
	^ #()
]

{ #category : 'testing' }
MyNoPiece >> renderPieceOn: aSquare [
	^ aSquare color isBlack ifTrue: [ 'x' ] ifFalse: [ 'z' ]
]
