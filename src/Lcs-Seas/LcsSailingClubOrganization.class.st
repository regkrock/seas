Class {
	#name : 'LcsSailingClubOrganization',
	#superclass : 'LcsInternalOrganization',
	#instVars : [
		'commodore',
		'members'
	],
	#category : 'Lcs-Seas-Core',
	#package : 'Lcs-Seas',
	#tag : 'Core'
}

{ #category : 'slot definitions' }
LcsSailingClubOrganization class >> commodoreSlotDefinition [
	<slotDefinition>
	^LcsCommodoreSlot new
]

{ #category : 'slot definitions' }
LcsSailingClubOrganization class >> membersSlotDefinition [
	<slotDefinition>
	^ LcsLocalCollectionSlot new
			slotName: 'members';
			addSlotType: LcsMembers;
			addCollectionMemberType: LcsMember;
			collectionClass: IdentitySet;
			yourself
]

{ #category : 'slot definitions' }
LcsSailingClubOrganization class >> parentSlotDefinition [
	<slotDefinition>
	^ LcsParentSlot new
]

{ #category : 'accessing' }
LcsSailingClubOrganization >> commodore [
	^self slotVarNamed: 'commodore'
]

{ #category : 'accessing' }
LcsSailingClubOrganization >> commodore: anObject [ 
	self slotVarNamed: 'commodore' put: anObject
]

{ #category : 'accessing' }
LcsSailingClubOrganization >> members [
	^ self slotVarNamed: 'members'
]

{ #category : 'accessing' }
LcsSailingClubOrganization >> members: anObject [
	self slotVarNamed: 'members' put: anObject
]
