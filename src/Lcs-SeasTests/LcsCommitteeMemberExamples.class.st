Class {
	#name : 'LcsCommitteeMemberExamples',
	#superclass : 'LcsExamples',
	#category : 'Lcs-SeasTests-Examples',
	#package : 'Lcs-SeasTests',
	#tag : 'Examples'
}

{ #category : 'examples' }
LcsCommitteeMemberExamples >> newCommitteeMember [
	<gtExample>
	| committeeMember |
	self ensureCurrentSystemIsSailingClubSystem.
	committeeMember := LcsCommitteeMember new.
	self assert: (committeeMember isKindOf: LcsCommitteeMember).
	^ committeeMember
]
