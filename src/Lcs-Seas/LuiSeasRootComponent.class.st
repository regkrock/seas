Class {
	#name : #LuiSeasRootComponent,
	#superclass : #LuiRoot,
	#category : #'Lcs-Seas-Base'
}

{ #category : #menus }
LuiSeasRootComponent class >> menuBarDefinition [
	| menuDefinition |
	menuDefinition := LcsMainMenuDefinition new.
	menuDefinition
		addMenuComponentDefintion: (LcsMenuItemDefinition new
			menuItemLabel: 'Home';
			targetClass: LuiHomeArea;
			yourself);
		addMenuComponentDefintion: (LcsMenuItemDefinition new
			menuItemLabel: 'Members';
			targetClass: LuiMember;
			yourself);
		addMenuComponentDefintion: (LcsMenuItemDefinition new
			menuItemLabel: 'Skippers';
			targetClass: LuiSkippers;
			yourself).
	^menuDefinition

]

{ #category : #setup }
LuiSeasRootComponent >> addMainNavigationMenuTo: aMainMenu [
	aMainMenu buildFrom: self menuDefinition
]

{ #category : #initialize }
LuiSeasRootComponent >> initialize [
	| mainPage |
	super initialize.
	self componentName: 'root'.
	self componentId: 'root'.
	self addComponent: (mainPage := LuiMainPage named: 'mainPage' on: self).

	self addMainNavigationMenuTo: (mainPage componentNamed: 'header/navigation').
	(mainPage componentNamed: 'header/title') domainObject: 'Seas Monmouth'.

]

{ #category : #setup }
LuiSeasRootComponent >> menuDefinition [
	^ self class menuBarDefinition
]

{ #category : #rendering }
LuiSeasRootComponent >> renderComponentOn: html [
	html div 
		addCommonProperties: self;
		with: [
			self renderSubcomponentsOn: html ]
]

{ #category : #updating }
LuiSeasRootComponent >> updateRoot: aRoot [

	super updateRoot: aRoot.
	aRoot title: 'SEAS Monmouth'.
	aRoot stylesheet url: LcsFileLibrary / #mainCss
]
