Class {
	#name : 'LcsSeasModule',
	#superclass : 'LcsModule',
	#instVars : [
		'organization'
	],
	#category : 'Lcs-Seas-Core',
	#package : 'Lcs-Seas',
	#tag : 'Core'
}

{ #category : 'slot definitions' }
LcsSeasModule class >> configurationSlotDefinition [
	<accessorSlotDefinition>
	^ self configurationSlotDefinitionOn: self moduleConfigurationClass
]

{ #category : 'configuration' }
LcsSeasModule class >> defaultModuleName [
	^ 'Seas Module'
]

{ #category : 'generated method' }
LcsSeasModule class >> moduleConfigurationClass [
	^ LcsSeasModuleConfiguration
]

{ #category : 'slot definitions' }
LcsSeasModule class >> organizationSlotDefinition [
	<accessorSlotDefinition>
	^ LcsDomainObjectSlot new
		slotName: 'organization';
		addSlotType: LcsSailingClubOrganization;
		addPostUpdateAction: (LcsUpdateAction new
				actionBlock: [ :value :domainObject :oldValue | 
					self currentUnitOfWork
						addPendingAddOf: value
						to: domainObject currentSystem legalEntitiesModule organizations ];
				description: 'Add organization to the organizations collection');
		yourself
]

{ #category : 'configuration' }
LcsSeasModule class >> owningModules [
	<owningModule: 'LcsSailingClubSystem' priority: 20>
]

{ #category : 'accessing' }
LcsSeasModule >> organization [
	^ self slotVarNamed: 'organization'
]

{ #category : 'accessing' }
LcsSeasModule >> organization: anObject [
	self slotVarNamed: 'organization' put: anObject
]
