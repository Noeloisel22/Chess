Class {
	#name : 'MyChessBoardTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessBoardTest >> testBackRanksAtStart [

	| board backRank |
	board := MyChessGame freshGame board.
	backRank := { MyRook. MyKnight. MyBishop. MyQueen. MyKing. MyBishop. MyKnight. MyRook }.
	'abcdefgh' withIndexDo: [ :file :i |
		| white black |
		white := (board at: file asString , '1') contents.
		black := (board at: file asString , '8') contents.
		self assert: white class equals: (backRank at: i).
		self assert: white isWhite.
		self assert: black class equals: (backRank at: i).
		self deny: black isWhite ]
]

{ #category : 'tests' }
MyChessBoardTest >> testMiddleOfBoardIsEmptyAtStart [

	| board |
	board := MyChessGame freshGame board.
	'abcdefgh' do: [ :file |
		3 to: 6 do: [ :rank |
			self deny: (board at: file asString , rank asString) hasPiece ] ]
]

{ #category : 'tests' }
MyChessBoardTest >> testPawnsAtStart [

	| board |
	board := MyChessGame freshGame board.
	'abcdefgh' do: [ :file |
		self assert: ((board at: file asString , '2') contents isKindOf: MyPawn).
		self assert: ((board at: file asString , '7') contents isKindOf: MyPawn) ]
]

{ #category : 'tests' }
MyChessBoardTest >> testStartingPositionHas32Pieces [

	| board |
	board := MyChessGame freshGame board.
	self
		assert: (board pieces select: [ :p | p isPresent ]) size
		equals: 32
]
