Class {
	#name : #LcsSailingClub,
	#superclass : #LcsOrganization,
	#category : #'Lcs-Seas'
}

{ #category : #accessing }
LcsSailingClub class >> commodoreSlotDefinition [
	<slotDefinition>
	^LcsAggregateSlot new
		slotName: 'commodore';
		addSlotType: LcsPerson;
		yourself
]

{ #category : #accessing }
LcsSailingClub >> commodore [

	^self getValueOfSlotNamed: 'commodore'
]

{ #category : #accessing }
LcsSailingClub >> commodore: anObject [ 
	self setValueOfSlotNamed: 'commodore' to: anObject
]
