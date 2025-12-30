Class {
	#name : 'LcsMember',
	#superclass : 'LcsDomainObject',
	#instVars : [
		'person'
	],
	#category : 'Lcs-Seas-Core',
	#package : 'Lcs-Seas',
	#tag : 'Core'
}

{ #category : 'slot definitions' }
LcsMember class >> parentSlotDefinition [
	<accessorSlotDefinition>
	^ LcsLocalCollectionReferenceSlot new
		addSlotType: LcsMembers;
		slotName: 'parent';
		accessPath: 'organization';
		collectionSlotName: 'members';
		collectionSlotModuleName: LcsSailingClubSystem defaultModuleName;
		yourself
]

{ #category : 'slot definitions' }
LcsMember class >> personSlotDefinition [
	<accessorSlotDefinition>
	^ LcsMemberOfGlobalCollectionSlot new
		slotName: 'person';
		addSlotType: LcsBasePerson;
		collectionSlotName: 'persons';
		collectionSlotModuleName: LcsLegalEntitiesModule defaultModuleName;
		yourself
]

{ #category : 'accessing' }
LcsMember >> person [
	^ self slotVarNamed: 'person'
]

{ #category : 'accessing' }
LcsMember >> person: anObject [
	self slotVarNamed: 'person' put: anObject
]
