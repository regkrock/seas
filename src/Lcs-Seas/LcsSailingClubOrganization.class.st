Class {
	#name : #LcsSailingClubOrganization,
	#superclass : #LcsOrganization,
	#instVars : [
		'commodore'
	],
	#category : #'Lcs-Seas-Core'
}

{ #category : #'slot definitions' }
LcsSailingClubOrganization class >> commodoreSlotDefinition [
	<slotDefinition>
	^LcsCommodoreSlot new
]

{ #category : #accessing }
LcsSailingClubOrganization >> commodore [
	^self slotVarNamed: 'commodore'
]

{ #category : #accessing }
LcsSailingClubOrganization >> commodore: anObject [ 
	self slotVarNamed: 'commodore' put: anObject
]
