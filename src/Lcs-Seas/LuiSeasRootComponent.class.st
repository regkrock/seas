Class {
	#name : #LuiSeasRootComponent,
	#superclass : #LuiRoot,
	#category : #'Lcs-Seas-Base'
}

{ #category : #menus }
LuiSeasRootComponent class >> applicationMenuBarDefinition [
	| menuDefinition |
	menuDefinition := LcsMainMenuDefinition new.
	menuDefinition
		addMenuComponentDefintion: (LcsMenuItemDefinition new
			menuItemLabel: 'Home';
			targetClass: LuiHomeArea;
			yourself);
		addMenuComponentDefintion: (LcsMenuItemDefinition new
			menuItemLabel: 'Members';
			targetClass: LuiMembers;
			yourself);
		addMenuComponentDefintion: (LcsMenuItemDefinition new
			menuItemLabel: 'Skippers';
			targetClass: LuiSkippers;
			yourself).
	^menuDefinition

]

{ #category : #menus }
LuiSeasRootComponent class >> menuBarDefinition [
	| menuDefinition |
	menuDefinition := LcsMainMenuDefinition new.
	menuDefinition
		addMenuComponentDefintion: (LcsMenuItemDefinition new
			menuItemLabel: 'Home';
			targetClass: LuiHomeArea;
			yourself);
		addMenuComponentDefintion: (LcsSubmenuDefinition new
			menuItemLabel: 'Who Are We';
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Our Trustees And Officers';
					url: 'officers.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Photos And Videos';
					url: 'photos.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Locations And Directions';
					url: 'locations.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Policies, Manuals and Forms';
					url: 'locations.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Contact Us';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Donations';
					url: 'donation.htm';
					yourself);
			yourself);
		addMenuComponentDefintion: (LcsSubmenuDefinition new
			menuItemLabel: 'Learn';
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Basic Sailing';
					url: 'basicsailing.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Cruising';
					url: 'cruisingcourse.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'NJ Boat Safety';
					url: 'njboatingsafety.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Skipper Development';
					url: 'skipperdevelop.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Foundation Skills';
					url: 'minicourses.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Boat Maintenance';
					url: 'boatmaintenance.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Educational Resources';
					url: 'educationalresources.htm';
					yourself);
			yourself);
		addMenuComponentDefintion: (LcsSubmenuDefinition new
			menuItemLabel: 'Sail';
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Local Sailing';
					url: 'localsailing.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Boat Reservations';
					url: 'boatreservation.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Boat and Crew Passes';
					url: 'passes.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Skipper Certification Process';
					url: 'skippercert.htm';
					yourself);
			"addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Current Skippers';
					url: 'private/PDF_documents/CurrentSkippers.pdf';
					yourself);"
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Cruises';
					url: 'cruises.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Our Fleet - Summary';
					url: 'fleet.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Fleet - Small Boats';
					url: 'smallboats.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Fleet - Keel Boats';
					url: 'keelboats.htm';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Sailing Links';
					url: 'sailinglinks.htm';
					yourself);
			yourself);
		addMenuComponentDefintion: (LcsSubmenuDefinition new
			menuItemLabel: 'Events';
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Meetings & Events';
					url: 'meetings.htm';
					yourself);
			yourself);
		addMenuComponentDefintion: (LcsSubmenuDefinition new
			menuItemLabel: 'Our Calendar';
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'All Events';
					url: 'calendars?cal=all';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'All Sailing';
					url: 'calendars?cal=sail';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Meetings and Social Events';
					url: 'calendars?cal=meet';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Classes and Training';
					url: 'calendars?cal=ed';
					yourself);
			addMenuComponentDefintion: (LcsMenuItemDefinition new
					menuItemLabel: 'Boat Maintenance';
					url: 'calendars?cal=maint';
					yourself);
			yourself);
		addMenuComponentDefintion: (LcsMenuItemDefinition new
			menuItemLabel: 'Club';
			yourself)
			.
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
