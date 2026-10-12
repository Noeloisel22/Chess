Class {
	#name : 'MyNoPiece',
	#superclass : 'Object',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyNoPiece class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : 'visiting' }
MyNoPiece >> acceptVisitor: aVisitor [
	^ aVisitor visitNoPiece: self
]

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
