Class {
	#name : #LcsSailingClub,
	#superclass : #LcsSystem,
	#category : #'Lcs-Seas-Core'
}

{ #category : #'slot definitions' }
LcsSailingClub class >> configurationSlotDefinition [
	<slotDefinition>
	^ self configurationSlotDefinitionOn: self moduleConfigurationClass
]

{ #category : #configuration }
LcsSailingClub class >> defaultModuleName [
	^ 'Sailing Club'
]

{ #category : #'generated method' }
LcsSailingClub class >> moduleConfigurationClass [
	^ LcsSailingClubConfiguration
]

{ #category : #'slot model' }
LcsSailingClub >> systemDomainClasses [
	| collection |
	collection := super systemDomainClasses.
	self addClasses: self class package definedClasses to: collection.
	^ collection 
]
