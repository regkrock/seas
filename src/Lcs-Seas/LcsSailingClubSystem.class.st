Class {
	#name : 'LcsSailingClubSystem',
	#superclass : 'LcsSystem',
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

{ #category : 'convenience' }
LcsSailingClubSystem >> organization [
	^ self seasModule organization
]

{ #category : 'slot model' }
LcsSailingClubSystem >> systemDomainClasses [
	| collection |
	collection := super systemDomainClasses.
	self addClasses: self class package definedClasses to: collection.
	^ collection 
]
