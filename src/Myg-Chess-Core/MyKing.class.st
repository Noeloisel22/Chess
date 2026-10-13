"
I move one square in any direction, but never to a threatened square. I can tell if I am in check or checkmated.
"
Class {
	#name : 'MyKing',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'moving' }
MyKing >> attackingSquares [

	^ self basicTargetSquares
]

{ #category : 'rendering' }
MyKing >> basicTargetSquares [

	"The king can move one square on each direction including diagonals"
	^ {
		square ifNotNil: #right.
		square up ifNotNil: #right.
		square ifNotNil: #up.
		square up ifNotNil: #left.
		square ifNotNil: #left.
		square left ifNotNil: #down.
		square ifNotNil: #down.
		square down ifNotNil: #right
	}
]

{ #category : 'rendering' }
MyKing >> glyphTable [
	^ Dictionary new
		at: #(true false) put: 'K';
		at: #(true true) put: 'k';
		at: #(false false) put: 'L';
		at: #(false true) put: 'l';
		yourself
]

{ #category : 'accessing' }
MyKing >> id [
	
	^ 'K'
]

{ #category : 'testing' }
MyKing >> isCheckMated [
	^ self legalTargetSquares isEmpty and: [
		  self threatenedSquares includes: self square ]
]

{ #category : 'testing' }
MyKing >> isInCheck [
	^ self threatenedSquares includes: self square
]

{ #category : 'testing' }
MyKing >> isKing [
	
	^ true
]

{ #category : 'rendering' }
MyKing >> targetSquaresLegal: aBoolean [
	| threats |
	threats := self threatenedSquares.
	^ self basicTargetSquares select: [ :s |
		  s notNil and: [
			  (threats includes: s) not and: [
				  s hasPiece not or: [ 
					s contents color ~= color and: [ 
						threats includes: s ] ] ] ] ]
]

{ #category : 'accessing' }
MyKing >> threatenedSquares [
	| visitor |
	visitor := MyThreatVisitor new.
	visitor enemyColor: self color negated.
	self board pieces do: [ :piece | piece acceptVisitor: visitor ].
	^ visitor threatenedSquares
]
