Class {
	#name : 'LcsGoodsOrService',
	#superclass : 'LcsDomainObject',
	#instVars : [
		'description',
		'availableDate',
		'endedDate'
	],
	#category : 'Lcs-Seas-Core',
	#package : 'Lcs-Seas',
	#tag : 'Core'
}

{ #category : 'slot definitions' }
LcsGoodsOrService class >> availableDateSlotDefinition [
	<slotDefinition>
	^ LcsDateSlot new
			slotName: 'availableDate';
			required: true;
			yourself
]

{ #category : 'slot definitions' }
LcsGoodsOrService class >> descriptionSlotDefinition [
	<slotDefinition>
	^ LcsStringSlot new
			slotName: 'description';
			yourself
]

{ #category : 'slot definitions' }
LcsGoodsOrService class >> endedDateSlotDefinition [
	<slotDefinition>
	^ LcsDateSlot new
			slotName: 'endedDate';
			initialValueBlock: [ :value :slot | Date newDay: 31 month: 12 year:  2100 ];
			yourself
]

{ #category : 'accessing' }
LcsGoodsOrService >> availableDate [
	^ self slotVarNamed: 'availableDate'
]

{ #category : 'accessing' }
LcsGoodsOrService >> availableDate: anObject [
	self slotVarNamed: 'availableDate' put: anObject
]

{ #category : 'accessing' }
LcsGoodsOrService >> description [
	^ self slotVarNamed: 'description'
]

{ #category : 'accessing' }
LcsGoodsOrService >> description: anObject [
	self slotVarNamed: 'description' put: anObject
]

{ #category : 'accessing' }
LcsGoodsOrService >> endedDate [
	^ self slotVarNamed: 'endedDate'
]

{ #category : 'accessing' }
LcsGoodsOrService >> endedDate: anObject [
	self slotVarNamed: 'endedDate' put: anObject
]
