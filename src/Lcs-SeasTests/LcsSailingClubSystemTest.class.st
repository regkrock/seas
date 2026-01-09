Class {
	#name : 'LcsSailingClubSystemTest',
	#superclass : 'LcsAbstractSystemTest',
	#category : 'Lcs-SeasTests-Tests',
	#package : 'Lcs-SeasTests',
	#tag : 'Tests'
}

{ #category : 'assertions' }
LcsSailingClubSystemTest >> assertLegalEntitiesModuleIsConfigured [
	| module |
	module := self currentSystem legalEntitiesModule.
	self assert: (module isKindOf: LcsLegalEntitiesModule).
	self assert: (module slotDefinitionNamed: 'contacts') notNil.
	self assert: (module contacts isKindOf: LcsLegalEntities).
	self assert: (module persons isKindOf: LcsPersons).
	self assert: (module organizations isKindOf: LcsOrganizations).
	self assert: (module persons unknownPerson isKindOf: LcsUnknownPerson).
	self assert: (module persons unknownPerson == module persons defaultInstance).
	self assert: (LcsPerson slotDefinitionNamed: #dateOfBirth) slotName equals: #dateOfBirth
]

{ #category : 'tests' }
LcsSailingClubSystemTest >> testCreation [
	self subject: LcsSailingClubSystem new.
	self assertCurrentSystemSetTo: LcsSailingClubSystem.
	self assertModuleConfigured: LcsSecurityModule.
	self assertModuleConfigured: LcsGeographyModule.
	self assertModuleConfigured: LcsLegalEntitiesModule.
	self assertModuleConfigured: LcsCalendarModule.
	self assertModuleConfigured: LcsSeasModule.
	self validateOrganization
]

{ #category : 'assertions' }
LcsSailingClubSystemTest >> validateOrganization [
	| organization members |
	organization := self subject organization.
	members := organization members.
	self assert: organization parent = self subject seasModule.
	self assert: (members isKindOf: LcsMembers).
	self assert: (members unknownInstance isKindOf: LcsMember).
	self assert: members unknownInstance parent == members
]
