Class {
	#name : 'MyThreatVisitor',
	#superclass : 'Object',
	#instVars : [
		'enemyColor',
		'threatenedSquares'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyThreatVisitor >> enemyColor: aColor [
	enemyColor := aColor
]

{ #category : 'initialization' }
MyThreatVisitor >> initialize [
	super initialize.
	threatenedSquares := OrderedCollection new.
]

{ #category : 'accessing' }
MyThreatVisitor >> threatenedSquares [
	^ threatenedSquares
]

{ #category : 'visiting' }
MyThreatVisitor >> visitNoPiece: aNoPiece [

]

{ #category : 'visiting' }
MyThreatVisitor >> visitPiece: aPiece [
	aPiece color = enemyColor ifTrue: [ 
		threatenedSquares addAll: aPiece attackingSquares 
	]
]
