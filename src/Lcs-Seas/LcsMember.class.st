Class {
	#name : #LcsMember,
	#superclass : #LcsDomainObject,
	#instVars : [
		'person'
	],
	#category : #'Lcs-Seas'
}

{ #category : #'slot definitions' }
LcsMember class >> parentSlotDefinition [
	<slotDefinition>
	^ LcsGlobalCollectionReferenceSlot new
			addSlotType: LcsMembers;
			slotName: 'parent';
			collectionSlotName: 'members';
			collectionSlotModuleName: 'Sailing Club System';
			yourself
]

{ #category : #'slot definitions' }
LcsMember class >> personSlotDefinition [
	<slotDefinition>
	^ LcsMemberOfGlobalCollectionSlot new
			slotName: 'person';
			addSlotType: LcsPerson;
			collectionSlotName: 'persons';
			collectionSlotModuleName: 'Legal Entities Module';
			yourself
]

{ #category : #accessing }
LcsMember >> person [
	^ self slotVarNamed: 'person'
]

{ #category : #accessing }
LcsMember >> person: anObject [
	self slotVarNamed: 'person' put: anObject
]
