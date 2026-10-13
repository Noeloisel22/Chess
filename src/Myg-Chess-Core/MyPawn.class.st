"
I am the abstract superclass of pawns. I move forward, capture diagonally and I am promoted when I reach the last rank (hook afterMoveTo:). My subclasses MyWhitePawn and MyBlackPawn define the direction.
"
Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'promotionPieceClass'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'constants' }
MyPawn class >> black [
	^ MyBlackPawn new
		color: Color black;
		yourself
]

{ #category : 'constants' }
MyPawn class >> white [
	^ MyWhitePawn new
		color: Color white;
		yourself
]

{ #category : 'promotion' }
MyPawn >> afterMoveTo: aSquare [
	aSquare file = self promotionFile ifTrue: [ self promoteOn: aSquare ]
]

{ #category : 'moving' }
MyPawn >> attackingSquares [
	square ifNil: [ ^ #( ) ].
	^ self diagonalSquaresFrom: square
]

{ #category : 'moving' }
MyPawn >> diagonalSquaresFrom: aSquare [
	self subclassResponsibility
]

{ #category : 'moving' }
MyPawn >> forwardSquareFrom: aSquare [
	self subclassResponsibility
]

{ #category : 'rendering' }
MyPawn >> glyphTable [
	^ Dictionary new
		at: #(true false) put: 'P';
		at: #(true true) put: 'p';
		at: #(false false) put: 'O';
		at: #(false true) put: 'o';
		yourself
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'moving' }
MyPawn >> initialFile [
	self subclassResponsibility
]

{ #category : 'initialization' }
MyPawn >> initialize [
	super initialize.
	promotionPieceClass := MyQueen
]

{ #category : 'promotion' }
MyPawn >> promoteOn: aSquare [
	| promoted |
	promoted := self promotedTo: self promotionPieceClass.
	square := nil.
	aSquare contents: promoted.
	promoted square: aSquare
]

{ #category : 'promotion' }
MyPawn >> promotedTo: aPieceClass [
	self subclassResponsibility
]

{ #category : 'promotion' }
MyPawn >> promotionFile [
	self subclassResponsibility
]

{ #category : 'accessing' }
MyPawn >> promotionPieceClass [
	^ promotionPieceClass
]

{ #category : 'accessing' }
MyPawn >> promotionPieceClass: aPieceClass [
	promotionPieceClass := aPieceClass
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	| targets oneStep twoSteps |
	targets := OrderedCollection new.
	square ifNil: [ ^ targets ].

	"Déplacement d'une case vers l'avant (doit être vide)"
	oneStep := self forwardSquareFrom: square.
	(oneStep notNil and: [ oneStep hasPiece not ]) ifTrue: [
		targets add: oneStep.

		"Déplacement de deux cases au départ (la 1ère et la 2ème doivent être vides)"
		(square file = self initialFile) ifTrue: [
			twoSteps := self forwardSquareFrom: oneStep.
			(twoSteps notNil and: [ twoSteps hasPiece not ]) ifTrue: [
				targets add: twoSteps ] ] ].

	"Captures en diagonale (doit contenir un ennemi)"
	(self diagonalSquaresFrom: square) do: [ :diagSquare |
		(diagSquare hasPiece and: [ diagSquare contents color ~= color ])
			ifTrue: [ targets add: diagSquare ] ].

	^ targets
]
