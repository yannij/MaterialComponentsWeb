"
A realization of the Material Design  layout structures described at: https://material.io/guidelines/layout/structure.html
"
Class {
	#name : #MCWBasicLayoutApp,
	#superclass : #MCWResponsiveApplication,
	#category : #'Material-Web-Demo'
}

{ #category : #initialization }
MCWBasicLayoutApp class >> applicationPath [

	^ 'material/layout'

]

{ #category : #'class initialization' }
MCWBasicLayoutApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self registerMaterialWebDevelopment: self applicationPath

]

{ #category : #'instance creation' }
MCWBasicLayoutApp class >> registerMaterialWebDeployment: aName [

	^ (super registerMaterialWebDeployment: aName)
		"addLibrary: MCWBasicLayoutLibrary;"
		yourself
]

{ #category : #initialization }
MCWBasicLayoutApp class >> registerToDeployment: aName [

	^ (super registerToDeployment: aName)
		"addLibrary: MCWBasicLayoutLibrary;"
		yourself
]

{ #category : #accessing }
MCWBasicLayoutApp >> applicationTitle [

	^ 'Layout Example'
]

{ #category : #initialization }
MCWBasicLayoutApp >> buildSideNavList [

	^ MCWListGroup new
		addGroupedList: (MCWListBasic new
			"subheader: 'List 1';"
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 1' iconName: 'assignment' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 2' iconName: 'bug_report' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 3' iconName: 'build' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 4' iconName: 'delete' callback: [ self sideNav menuItemCallback ]);
			yourself);
		addGroupedList: (MCWListBasic new
			subheader: 'List 2';
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 5' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 6' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 7' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemSeparator new);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 8' iconName: 'star' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 9' iconName: 'star' callback: [ self sideNav menuItemCallback ]);
			yourself);
		yourself

]

{ #category : #initialization }
MCWBasicLayoutApp >> buildSideSheet [

	^ MCWSideSheet new
]

{ #category : #initialization }
MCWBasicLayoutApp >> buildSideSheetList [

	^ MCWListGroup new
		addGroupedList: (MCWListBasic new
			subheader: 'Categories';
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: [ ]);
			addListItem: (MCWListItemSeparatorInset new);
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: [ ]);
			addListItem: (MCWListItemSeparatorInset new);
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: [ ]);
			addListItem: (MCWListItemSeparatorInset new);
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: [ ]);
			yourself);
		addGroupedList: (MCWListBasic new
			subheader: 'Category';
			addListItem: (MCWListItemSlider itemText: 'Category' callback: [ ]);
			yourself);
		addGroupedList: (MCWListBasic new
			subheader: 'Category';
			addListItem: (MCWListItemSlider itemText: 'Category' callback: [ ]);
			yourself);
		yourself

]

{ #category : #accessing }
MCWBasicLayoutApp >> drawerSubtitle [

	^ 'Sub-example'
]

{ #category : #accessing }
MCWBasicLayoutApp >> drawerTitle [

	^ 'Example'
]
