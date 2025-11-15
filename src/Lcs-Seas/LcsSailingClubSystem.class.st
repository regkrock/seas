Class {
	#name : #LcsSailingClubSystem,
	#superclass : #LcsSystem,
	#instVars : [
		'organization',
		'members'
	],
	#category : #'Lcs-Seas-Core'
}

{ #category : #'slot definitions' }
LcsSailingClubSystem class >> configurationSlotDefinition [
	<slotDefinition>
	^ self configurationSlotDefinitionOn: self moduleConfigurationClass
]

{ #category : #configuration }
LcsSailingClubSystem class >> defaultModuleName [
	^ 'Sailing Club System'
]

{ #category : #'slot definitions' }
LcsSailingClubSystem class >> membersSlotDefinition [
	<slotDefinition>
	^ LcsGlobalCollectionSlot new
			addSlotType: LcsMembers;
			addCollectionMemberType: LcsMember;
			slotName: 'members';
			yourself
]

{ #category : #'generated method' }
LcsSailingClubSystem class >> moduleConfigurationClass [
	^ LcsSailingClubSystemConfiguration
]

{ #category : #'slot definitions' }
LcsSailingClubSystem class >> organizationSlotDefinition [
	<slotDefinition>
	^ LcsDomainObjectSlot new
			slotName: 'organization';
			slotTypes: (OrderedCollection with: LcsSailingClubOrganization);
			addPostUpdateAction: (LcsUpdateAction new
				actionBlock: [ :value :domainObject :oldValue | 
					self currentUnitOfWork addPendingAddOf: value to: domainObject legalEntitiesModule organizations ];
				description: 'Add organization to the organizations collection');
			yourself
]

{ #category : #accessing }
LcsSailingClubSystem >> members [
	^ self slotVarNamed: 'members'
]

{ #category : #accessing }
LcsSailingClubSystem >> members: anObject [
	self slotVarNamed: 'members' put: anObject
]

{ #category : #accessing }
LcsSailingClubSystem >> organization [
	^ self slotVarNamed: 'organization'
]

{ #category : #accessing }
LcsSailingClubSystem >> organization: anObject [
	self slotVarNamed: 'organization' put: anObject
]

{ #category : #'slot model' }
LcsSailingClubSystem >> systemDomainClasses [
	| collection |
	collection := super systemDomainClasses.
	self addClasses: self class package definedClasses to: collection.
	^ collection 
]
