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
	organization := self seasMonmouthOrganizationWithMembers.
	steeringCommitte := LcsSteeringCommittee new.
	self assert: steeringCommitte parent isNil.
	
	"Need to add this manually to the collection since it is a local collection."
	organization committees add: steeringCommitte.
	
	self assert: (organization committees includes: steeringCommitte).
	self assert: steeringCommitte parent equals: organization committees.
	
	^ steeringCommitte
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> organization [
	^ self currentSystem organization
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> populatedExecutiveCommittee [
	<gtExample>
	| organization executiveCommittee commodore samSmith |
	executiveCommittee := self executiveCommittee.
	organization := self organization.
	samSmith := organization activeMemberWithFirstName: 'Sam' familyName: 'Smith'.
	commodore := LcsCommitteeMember new member: samSmith.
	executiveCommittee commodore: commodore.

	^ executiveCommittee
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> seasMonmouthOrganization [
	<gtExample>
	| organization |
	self ensureCurrentSystemIsSailingClubSystem.
	self assert: LcsMember hasSlotModel.
	self assert: LcsMembers hasSlotModel.
	organization := self organization.
	organization
		organizationName: 'Seas Monmouth';
		legalName: 'The Society for the Education of American Sailors, Inc.';
		mainAddress: LcsAddressExamples new seasMonmouthAddress.
	self
		assert: organization legalName
				= 'The Society for the Education of American Sailors, Inc.'.
	self assert: organization fullName = 'Seas Monmouth'.
	^ organization
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> seasMonmouthOrganizationWithMembers [
	<gtExample>
	| organization foundPerson johnDoe samSmith samSmithMembership |
	organization := self seasMonmouthOrganization.
	johnDoe := LcsPersonExamples new johnDoe.
	self assert: (organization hasContactWithFirstName: 'John' familyName: 'Doe').
	foundPerson := organization contactWithFirstName: 'John' familyName: 'Doe'.
	self assert: foundPerson firstName equals: 'John'.
	self assert: foundPerson familyName equals: 'Doe'.
	samSmith := LcsPersonExamples new samSmith.
	self assert: LcsMember hasSlotModel.
	self assert: LcsMembers hasSlotModel.
	samSmithMembership := LcsMember new
					person: samSmith;
					yourself.
	organization members add: samSmithMembership.
	self assert: (organization members includes: samSmithMembership).
	^ organization
]
