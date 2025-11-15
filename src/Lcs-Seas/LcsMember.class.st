Class {
	#name : #LcsMember,
	#superclass : #LcsDomainObject,
	#category : #'Lcs-Seas'
}

{ #category : #'slot definitions' }
LcsMember class >> parentSlotDefinition [
	<slotDefinition>
	^ LcsGlobalCollectionReferenceSlot new
			addSlotType: LcsMembers;
			slotName: 'parent';
			collectionSlotName: 'members';
			collectionSlotModuleName: 'Sailing Club System';
			yourself
]
