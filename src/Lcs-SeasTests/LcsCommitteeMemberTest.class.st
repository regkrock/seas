Class {
	#name : 'LcsCommitteeMemberTest',
	#superclass : 'LcsSailingClubSystemRunningTest',
	#category : 'Lcs-SeasTests-Tests',
	#package : 'Lcs-SeasTests',
	#tag : 'Tests'
}

{ #category : 'tests' }
LcsCommitteeMemberTest >> testCreation [
	| committeeMember |
"	executiveCommittee := LcsSailingClubOrganizationExamples new executiveCommittee."
	committeeMember := LcsCommitteeMember new.
	self assert: (committeeMember isKindOf: LcsCommitteeMember) 
]
