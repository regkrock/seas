Class {
	#name : 'LcsSailingClubSystemExamples',
	#superclass : 'LcsBaseSystemExamples',
	#category : 'Lcs-SeasTests-Examples',
	#package : 'Lcs-SeasTests',
	#tag : 'Examples'
}

{ #category : 'tests' }
LcsSailingClubSystemExamples >> sailClubSystem [
	<gtExample>
	self ensureCurrentSystemIsSailingClubSystem.
	self assertModuleConfigured: LcsSecurityModule.
	self assertModuleConfigured: LcsGeographyModule.
	self assertModuleConfigured: LcsLegalEntitiesModule.
	self assertModuleConfigured: LcsCalendarModule.
	self assertModuleConfigured: LcsSeasModule.
	self validateOrganization.
	^ self currentSystem
]

{ #category : 'assertions' }
LcsSailingClubSystemExamples >> validateLegalEntitiesModuleIsConfigured [
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

{ #category : 'assertions' }
LcsSailingClubSystemExamples >> validateOrganization [
	| organization members |
	organization := self currentSystem organization.
	members := organization members.
	self assert: organization parent = self currentSystem seasModule.
	self assert: (members isKindOf: LcsMembers).
	self assert: (members unknownInstance isKindOf: LcsMember).
	self assert: members unknownInstance parent == members
]
