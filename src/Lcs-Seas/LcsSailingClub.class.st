Class {
	#name : #LcsSailingClub,
	#superclass : #LcsOrganization,
	#category : #'Lcs-Seas'
}

{ #category : #accessing }
LcsSailingClub class >> commodoreSlotDefinition [

	^LcsSlotDefinition new
		slotName: 'commodore';
		addSlotType: LcsPerson;
		yourself
]

{ #category : #accessing }
LcsSailingClub >> commodore [

	^self valueOfSlot: #'commodore'
]

{ #category : #accessing }
LcsSailingClub >> commodore: anObject [ 
	self setValueOfSlotNamed: #commodore to: anObject
]
