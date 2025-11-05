Class {
	#name : #BaselineOfSeas,
	#superclass : #BaselineOf,
	#category : #BaselineOfSeas
}

{ #category : #loading }
BaselineOfSeas class >> manuallyLoadLepiter [

	| repository defaultDatabase currentProperties |
	
	repository := IceRepository registry 
				detect: [ :aRepository | aRepository name = 'seas' ] 
				ifNone: [nil].

	defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
	currentProperties := defaultDatabase properties.
	currentProperties addRegisteredDirectory: repository repositoryDirectory / 'lepiter'.
	defaultDatabase reload.
]

{ #category : #baseline }
BaselineOfSeas >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Seas'.
			spec package: 'Lcs-Seas'.
			spec package: 'Lcs-SeasUI'.
			"spec
				baseline: 'BaseLineOfLcsBase'.
					with: [ spec repository: 'github://j-brant/SmaCC' ];"
		]
]
