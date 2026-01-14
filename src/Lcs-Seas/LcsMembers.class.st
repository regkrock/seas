Class {
	#name : 'LcsMembers',
	#superclass : 'LcsDomainCollection',
	#instVars : [
		'unknownInstance'
	],
	#category : 'Lcs-Seas-Core',
	#package : 'Lcs-Seas',
	#tag : 'Core'
}

{ #category : 'slot definitions' }
LcsMembers class >> unknownInstanceSlotDefinition [
	<accessorSlotDefinition>
	^ LcsUnknownInstanceSlot new
			addSlotType: LcsMember;
			initialValueBlock: [ :parentDomainObject :slot | 
				slot slotTypes any new 
					parent: parentDomainObject;
					person: (slot currentSystem legalEntitiesModule persons unknownPerson);
					yourself ];
			required: true;
			yourself
]

{ #category : 'querying' }
LcsMembers >> activeMemberWithFirstName: aFirstName familyName: aFamilyName [
	^ self find: [ :each | each isActiveWithFirstName: aFirstName familyName: aFamilyName ]
]

{ #category : 'defaults' }
LcsMembers >> defaultInstance [
	^ self unknownInstance
]

{ #category : 'accessing' }
LcsMembers >> unknownInstance [
	^ self slotVarNamed: 'unknownInstance'
]

{ #category : 'accessing' }
LcsMembers >> unknownInstance: anObject [
	self slotVarNamed: 'unknownInstance' put: anObject
]
