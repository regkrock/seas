Class {
	#name : 'LcsSailingClubOrganizationExamples',
	#superclass : 'LcsObjectExamples',
	#category : 'Lcs-SeasTests-Examples',
	#package : 'Lcs-SeasTests',
	#tag : 'Examples'
}

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> contactWithFirstName: aFirstName familyName: aFamilyName [
	^ (self organization contactWithFirstName: aFirstName familyName: aFamilyName)
		ifNil: [
				LcsPersonExamples new
					newPersonWithFirstName: aFirstName
					familyName: aFamilyName ]
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> executiveCommittee [
	<gtExample>
	| organization steeringCommittee |
	organization := self seasMonmouthOrganizationWithPersistedMembers.
	self assert: organization committees isEmpty.
	steeringCommittee := LcsSteeringCommittee new
		organizationName: 'Steering Committee';
		yourself.
	self assert: steeringCommittee parent isNil.
	"Need to add this manually to the collection since it is a local collection."
	organization committees add: steeringCommittee.
	self assert: (organization committees includes: steeringCommittee).
	self assert: steeringCommittee parent equals: organization committees.
	self assert: organization steeringCommittee == steeringCommittee.
	^ organization steeringCommittee.
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> membershipFor: aPerson [
	| membership |
	membership := self organization
			activeMemberWithFirstName: aPerson firstName
			familyName: aPerson familyName.
	membership ifNotNil: [ ^ membership ].
	membership := LcsMember new
			person: aPerson;
			yourself.
	self organization members add: membership.
	self assert: (self organization members includes: membership).
	^ membership
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> membershipForFirstName: aFirstName familyName: aFamilyName [
	| membership person |
	membership := self organization
			activeMemberWithFirstName: aFirstName
			familyName: aFamilyName.
	membership ifNotNil: [ ^ membership ].
	person := self contactWithFirstName: aFirstName familyName: aFamilyName.
	^ self membershipFor: person
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> organization [
	^ self currentSystem organization
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> populatedExecutiveCommittee [
	<gtExample>
	| organization executiveCommittee commodore member |
	executiveCommittee := self executiveCommittee.
	organization := self organization.
	member := organization activeMemberWithFirstName: 'Karen' familyName: 'Ruckdeschel'.
	commodore := LcsCommitteeMember new
		title: 'Commodore';
		member: member;
		yourself.
	executiveCommittee commodore: commodore.
	self assert: executiveCommittee commodore == commodore.
	^ executiveCommittee
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> seasMonmouthOrganization [
	<gtExample>

	self ensureCurrentSystemIsSailingClubSystem.
	self assert: LcsMember hasSlotModel.
	self assert: LcsMembers hasSlotModel.
	self organization organizationName isEmpty ifTrue: [
		self organization organizationName: 'Seas Monmouth' ].
	self organization legalName isEmpty ifTrue: [
		self organization legalName: 'SEAS Monmouth Chapter' ].
	self organization mainAddress isUnknown ifTrue: [
		self organization mainAddress: LcsAddressExamples new seasMonmouthAddress ].
	self assert: self organization legalName equals: 'SEAS Monmouth Chapter'.
	self assert: self organization fullName = 'Seas Monmouth'.
	^ self organization
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> seasMonmouthOrganizationWithMembers [
	<gtExample>
	| organization memberNames|
	memberNames := 	#( 
		#('Karen' 'Ruckdeschel') 
		#('Svetlana' 'Novikova')
		#('Terri' 'Lawrence')
		#('Toni' 'Valenitino')
		#('Ray' 'Kimber')
		#('Viktor' 'Bek')
		#('Glen' 'Noe')
		#('Joyce' 'Spinello')
		#('Peter' 'Shearer')
		#('Yasar' 'Chadruy')
		#('Matt' 'Montanari')
		#('Reg' 'Krock') ).
	organization := self seasMonmouthPersistedOrganization.
	memberNames do: [ :eachPerson | 
			self membershipForFirstName: eachPerson first familyName: eachPerson last].
	memberNames do: [ :eachPerson |
		self assert: (self organization hasActiveMemberWithFirstName: eachPerson first familyName: eachPerson last) ].
	^ organization
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> seasMonmouthOrganizationWithPersistedMembers [
	<gtExample>
	| organization |
	self clearUnitOfWork.
	organization := self seasMonmouthOrganizationWithMembers.
	self currentSystem applyChanges.
	self assert: organization committees isEmpty.
	^ organization
]

{ #category : 'examples' }
LcsSailingClubOrganizationExamples >> seasMonmouthPersistedOrganization [
	<gtExample>
	| organization |
	organization := self seasMonmouthOrganization.
	self currentSystem applyChanges.
	^ self organization
]
