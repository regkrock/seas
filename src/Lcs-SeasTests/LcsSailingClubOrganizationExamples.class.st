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
	| organization |
	organization := self seasMonmouthOrganization.
	LcsCommittee new.
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
