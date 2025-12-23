Class {
	#name : 'LcsSailingClubOrganizationExamples',
	#superclass : 'LcsObjectExamples',
	#category : 'Lcs-SeasTests-Examples',
	#package : 'Lcs-SeasTests',
	#tag : 'Examples'
}

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> executiveCommittee [
	<gtExample>
	| organization steeringCommitte |
	organization := self seasMonmouthOrganization.
	steeringCommitte := LcsSteeringCommittee new.
	self assert: steeringCommitte parent isNil.
	
	"Need to add this manually to the collection since it is a local collection."
	organization committees add: steeringCommitte.
	
	self assert: (organization committees includes: steeringCommitte).
	self assert: steeringCommitte parent equals: organization committees.
	
	^ organization
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> seasMonmouthOrganization [
	<gtExample>
	| organization |
	self ensureCurrentSystemIsSailingClubSystem.
	organization := self currentSystem organization.
	organization
		organizationName: 'Seas Monmouth';
		legalName: 'The Society for the Education of American Sailors, Inc.';
		mainAddress: (LcsAddressExamples new seasMonmouthAddress).
	self assert: organization legalName = 'The Society for the Education of American Sailors, Inc.'.
	self assert: organization fullName = 'Seas Monmouth'.
	^ organization 
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> seasMonmouthOrganizationWithMembers [
	<gtExample>
	| organization foundPerson person1 person2 |
	organization := self seasMonmouthOrganization.
	person1 := LcsPersonExamples new johnDoe.
	self assert: (organization hasContactWithFirstName: 'John' familyName: 'Doe').
	foundPerson := organization contactWithFirstName: 'John' familyName: 'Doe'.
	self assert: foundPerson firstName equals: 'John'.
	self assert: foundPerson familyName equals: 'Doe'.
	person2 := LcsPersonExamples new samSmith.
	^ organization
]
