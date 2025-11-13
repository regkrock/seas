Class {
	#name : #LcsSailingClubSystem,
	#superclass : #LcsSystem,
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

{ #category : #'generated method' }
LcsSailingClubSystem class >> moduleConfigurationClass [
	^ LcsSailingClubSystemConfiguration
]

{ #category : #'slot model' }
LcsSailingClubSystem >> systemDomainClasses [
	| collection |
	collection := super systemDomainClasses.
	self addClasses: self class package definedClasses to: collection.
	^ collection 
]
