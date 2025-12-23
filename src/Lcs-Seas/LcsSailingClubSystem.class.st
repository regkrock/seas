Class {
	#name : 'LcsSailingClubSystem',
	#superclass : 'LcsSystem',
	#instVars : [
		'organization'
	],
	#category : 'Lcs-Seas-Core',
	#package : 'Lcs-Seas',
	#tag : 'Core'
}

{ #category : 'slot definitions' }
LcsSailingClubSystem class >> configurationSlotDefinition [
	<accessorSlotDefinition>
	^ self configurationSlotDefinitionOn: self moduleConfigurationClass
]

{ #category : 'configuration' }
LcsSailingClubSystem class >> defaultModuleName [
	^ 'Sailing Club System'
]

{ #category : 'generated method' }
LcsSailingClubSystem class >> moduleConfigurationClass [
	^ LcsSailingClubSystemConfiguration
]

{ #category : 'slot definitions' }
LcsSailingClubSystem class >> organizationSlotDefinition [
	<accessorSlotDefinition>
	^ LcsDomainObjectSlot new
		slotName: 'organization';
		addSlotType: LcsSailingClubOrganization;
		addPostUpdateAction: (LcsUpdateAction new
				actionBlock: [ :value :domainObject :oldValue | 
					self currentUnitOfWork
						addPendingAddOf: value
						to: domainObject legalEntitiesModule organizations ];
				description: 'Add organization to the organizations collection');
		yourself
]

{ #category : 'accessing' }
LcsSailingClubSystem >> organization [
	^ self slotVarNamed: 'organization'
]

{ #category : 'accessing' }
LcsSailingClubSystem >> organization: anObject [
	self slotVarNamed: 'organization' put: anObject
]

{ #category : 'slot model' }
LcsSailingClubSystem >> systemDomainClasses [
	| collection |
	collection := super systemDomainClasses.
	self addClasses: self class package definedClasses to: collection.
	^ collection 
]
