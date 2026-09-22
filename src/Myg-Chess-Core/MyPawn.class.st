Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
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

{ #category : 'as yet unclassified' }
MyPawn >> attackingSquares [
	square ifNil: [ ^ #( ) ].
	^ self diagonalSquaresFrom: square
]

{ #category : 'as yet unclassified' }
MyPawn >> diagonalSquaresFrom: aSquare [
	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
MyPawn >> initialFile [
	self subclassResponsibility
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
