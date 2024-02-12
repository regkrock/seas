Class {
	#name : #BaselineOfSeas,
	#superclass : #BaselineOf,
	#category : #BaselineOfSeas
}

{ #category : #loading }
BaselineOfSeas class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'seas' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfSeas >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Seas'.
			spec package: 'Lcs-Seas'.
		]
]
