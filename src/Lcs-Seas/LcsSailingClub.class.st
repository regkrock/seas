Class {
	#name : #LcsSailingClub,
	#superclass : #LcsOrganization,
	#instVars : [
		'commodore'
	],
	#category : #'Lcs-Seas-Base'
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

	^self slotVarNamed: 'commodore'
]

{ #category : #accessing }
LcsSailingClub >> commodore: anObject [ 
	self slotVarNamed: 'commodore' put: anObject
]
