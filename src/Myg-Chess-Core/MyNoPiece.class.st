"
I represent an empty square (Null Object pattern). There is only one instance, shared by all empty squares (Flyweight pattern): use MyNoPiece uniqueInstance.
"
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
