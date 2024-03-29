"
I am a demo application showing how to use the various Quasar Framework components from Seaside.
"
Class {
	#name : #QuasarDemoComponentApp,
	#superclass : #QuasarApplication,
	#instVars : [
		'demoName'
	],
	#category : #'Quasar-Demo'
}

{ #category : #initialization }
QuasarDemoComponentApp class >> applicationPath [

	^ 'quasar/component-demo'
]

{ #category : #initialization }
QuasarDemoComponentApp class >> initialize [
	"Register path with Seaside.
	self initialize.
	WAAdmin unregister: self applicationPath.
	"

	^ self mdqRegisterDeployment: self applicationPath
]

{ #category : #accessing }
QuasarDemoComponentApp >> applicationTitle [

	^ 'QComponents'
]

{ #category : #accessing }
QuasarDemoComponentApp >> demoName [

	^ demoName
]

{ #category : #accessing }
QuasarDemoComponentApp >> demoName: anObject [

	demoName := anObject
]

{ #category : #rendering }
QuasarDemoComponentApp >> demoNames [

	^ #(
	Misc
	Select
	DateTime
	)
]

{ #category : #rendering }
QuasarDemoComponentApp >> demoTableRefs [

	^ '
const columns = [
  {
    name: ''name'',
    required: true,
    label: ''Dessert (100g serving)'',
    align: ''left'',
    field: row => row.name,
    format: val => `${val}`,
    sortable: true
  },
  { name: ''calories'', align: ''center'', label: ''Calories'', field: ''calories'', sortable: true },
  { name: ''fat'', label: ''Fat (g)'', field: ''fat'', sortable: true },
  { name: ''carbs'', label: ''Carbs (g)'', field: ''carbs'' },
  { name: ''protein'', label: ''Protein (g)'', field: ''protein'' },
  { name: ''sodium'', label: ''Sodium (mg)'', field: ''sodium'' },
  { name: ''calcium'', label: ''Calcium (%)'', field: ''calcium'', sortable: true, sort: (a, b) => parseInt(a, 10) - parseInt(b, 10) },
  { name: ''iron'', label: ''Iron (%)'', field: ''iron'', sortable: true, sort: (a, b) => parseInt(a, 10) - parseInt(b, 10) }
];

const rows = [
  {
    name: ''Frozen Yogurt'',
    calories: 159,
    fat: 6.0,
    carbs: 24,
    protein: 4.0,
    sodium: 87,
    calcium: ''14%'',
    iron: ''1%''
  },
  {
    name: ''Ice cream sandwich'',
    calories: 237,
    fat: 9.0,
    carbs: 37,
    protein: 4.3,
    sodium: 129,
    calcium: ''8%'',
    iron: ''1%''
  },
  {
    name: ''Eclair'',
    calories: 262,
    fat: 16.0,
    carbs: 23,
    protein: 6.0,
    sodium: 337,
    calcium: ''6%'',
    iron: ''7%''
  },
  {
    name: ''Cupcake'',
    calories: 305,
    fat: 3.7,
    carbs: 67,
    protein: 4.3,
    sodium: 413,
    calcium: ''3%'',
    iron: ''8%''
  },
  {
    name: ''Gingerbread'',
    calories: 356,
    fat: 16.0,
    carbs: 49,
    protein: 3.9,
    sodium: 327,
    calcium: ''7%'',
    iron: ''16%''
  },
  {
    name: ''Jelly bean'',
    calories: 375,
    fat: 0.0,
    carbs: 94,
    protein: 0.0,
    sodium: 50,
    calcium: ''0%'',
    iron: ''0%''
  },
  {
    name: ''Lollipop'',
    calories: 392,
    fat: 0.2,
    carbs: 98,
    protein: 0,
    sodium: 38,
    calcium: ''0%'',
    iron: ''2%''
  },
  {
    name: ''Honeycomb'',
    calories: 408,
    fat: 3.2,
    carbs: 87,
    protein: 6.5,
    sodium: 562,
    calcium: ''0%'',
    iron: ''45%''
  },
  {
    name: ''Donut'',
    calories: 452,
    fat: 25.0,
    carbs: 51,
    protein: 4.9,
    sodium: 326,
    calcium: ''2%'',
    iron: ''22%''
  },
  {
    name: ''KitKat'',
    calories: 518,
    fat: 26.0,
    carbs: 65,
    protein: 7,
    sodium: 54,
    calcium: ''12%'',
    iron: ''6%''
  }
]'
]

{ #category : #'demo - date time' }
QuasarDemoComponentApp >> renderDemoDateTimeOn: html [

	html div style: 'max-width: 300px'; with: [
		html qInput filled; vModel: 'date'; with: [
			html qTemplate vSlot: 'prepend'; with: [
				html qIcon name: 'event'; class: 'cursor-pointer'; with: [
					html qPopupProxy cover; transitionShow: 'scale'; transitionHide: 'scale'; with: [
						html qDate vModel: 'date'; mask: 'YYYY-MM-DD HH:mm'; with: [
							html div class: 'row items-center justify-end'; with: [
								html qBtn vClosePopUp; label: 'Close'; color: 'primary'; flat ] ] ] ] ].
			html qTemplate vSlot: 'append'; with: [
				html qIcon name: 'access_time'; class: 'cursor-pointer'; with: [
					html qPopupProxy cover; transitionShow: 'scale'; transitionHide: 'scale'; with: [
						html qTime vModel: 'date'; mask: 'YYYY-MM-DD HH:mm'; format24h; with: [
							html div class: 'row items-center justify-end'; with: [
								html qBtn vClosePopUp; label: 'Close'; color: 'primary'; flat ] ] ] ] ] ] ]
]

{ #category : #'demo - select' }
QuasarDemoComponentApp >> renderDemoSelectOn: html [

	html qForm vOnSubmit: 'onSubmit'; class: 'q-gutter-md'; with: [
		html qSelect
			name: 'preferred_genre'; label: 'Preferred genre';
			vModel: 'preferred'; options: 'options';
			color: 'primary'; filled; clearable.
		html qSelect
			name: 'accepted_genres'; label: 'Accepted genre';
			vModel: 'accepted'; options: 'options';
			color: 'primary'; multiple; filled; clearable.
		html div with: [
			html qBtn label: 'Submit'; type: 'submit'; color: 'primary' ] ].

	html html: '<q-card v-if="submitEmpty" flat bordered class="q-mt-md bg-grey-2">
      <q-card-section>
        Submitted form contains empty formData.
      </q-card-section>
    </q-card>
    <q-card v-else-if="submitResult.length > 0" flat bordered class="q-mt-md bg-grey-2">
      <q-card-section>Submitted form contains the following formData (key = value):</q-card-section>
      <q-separator></q-separator>
      <q-card-section class="row q-gutter-sm items-center">
        <div
          v-for="(item, index) in submitResult"
          :key="index"
          class="q-px-sm q-py-xs bg-grey-8 text-white rounded-borders text-center text-no-wrap"
        >{{ item.name }} = {{ item.value }}</div>
      </q-card-section>
    </q-card>'
]

{ #category : #'demo - example' }
QuasarDemoComponentApp >> renderExampleButtonToggleOn: html [

	html div class: 'q-pa-md'; class: 'q-gutter-sm'; with: [
		html html: '<q-btn-toggle
        v-model="model"
        push
        glossy
        toggle-color="primary"
        :options="[
          {label: ''One'', value: ''one''},
          {label: ''Two'', value: ''two''},
          {label: ''Three'', value: ''three''}
        ]"
      ></q-btn-toggle>' ]
]

{ #category : #'demo - example' }
QuasarDemoComponentApp >> renderExampleButtonsOn: html [

	html div class: 'q-pa-md'; class: 'q-gutter-sm'; with: [
		html qBtn color: 'white'; textColor: 'black'; label: 'Standard'.
		html qBtn color: 'primary'; label: 'Primary'.
		html qBtn color: 'secondary'; label: 'Secondary'.
		html qBtn color: 'amber'; label: 'Amber'.
		html qBtn color: 'brown-5'; label: 'Brown 5'.
		html qBtn color: 'deep-orange'; label: 'Deep Orange'.
		html qBtn color: 'purple'; label: 'Purple'.
		html qBtn color: 'black'; label: 'Black' ]
]

{ #category : #'demo - example' }
QuasarDemoComponentApp >> renderExampleCardsOn: html [

	html div class: 'q-pa-md row items-start q-gutter-md'; with: [
		html qCard class: 'my-card bg-secondary text-white'; with: [
			html qCardSection with: [
				html div class: 'text-h6'; with: 'Our Changing Planet'.
				html div class: 'text-subtitle2'; with: 'by John Doe' ].
			html qCardSection with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'.
			html qSeparator dark.
			html qCardActions with: [
				html qBtn flat; with: 'Action 1'.
				html qBtn flat; with: 'Action 2' ] ].
		html qCard class: 'my-card'; with: [
			html qCardSection with: [
				html div class: 'text-h6'; with: 'Our Changing Planet'.
				html div class: 'text-subtitle2'; with: 'by John Doe' ].
			html qSeparator dark.
			html qCardActions vertical; with: [
				html qBtn flat; with: 'Action 1'.
				html qBtn flat; with: 'Action 2' ] ].
		html qCard class: 'my-card bg-purple text-white'; with: [
			html qCardSection with: [
				html div class: 'text-h6'; with: 'Our Changing Planet'.
				html div class: 'text-subtitle2'; with: 'by John Doe' ].
			html qSeparator dark.
			html qCardActions with: [
				html qBtn flat; with: 'Action 1'.
				html qBtn flat; with: 'Action 2' ] ].
		html qCard flat; bordered; class: 'my-card bg-grey-1'; with: [
			html qCardSection with: [
				html div class: 'row items-center no-wrap'; with: [
				html div class: 'col'; with: [
					html div class: 'text-h6'; with: 'Our Planet'.
					html div class: 'text-subtitle2'; with: 'by John Doe' ].
				html div class: 'col-auto'; with: [
					html qBtn color: 'grey-7'; round; flat; icon: 'more_vert'; with: [
						html qMenu cover; autoClose; with: [
							html qList with: [
								html qItem clickable; with: [
									html qItemSection with: 'Remove Card' ].
								html qItem clickable; with: [
									html qItemSection with: 'Send Feedback' ].
								html qItem clickable; with: [
									html qItemSection with: 'Share' ] ] ] ]
					 ] ] ].
			html qCardSection with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'.
			html qSeparator dark.
			html qCardActions with: [
				html qBtn flat; with: 'Action 1'.
				html qBtn flat; with: 'Action 2' ] ] ]
]

{ #category : #'demo - example' }
QuasarDemoComponentApp >> renderExampleColorPickerOn: html [

	html div class: 'q-pa-md'; class: 'q-gutter-sm'; with: [
		html qInput filled; vModel: 'color'; with: [
			html qTemplate vSlot: 'append'; with: [
				html qIcon name: 'colorize'; class: 'cursor-pointer'; with: [
					html qPopupProxy cover; transitionShow: 'scale'; transitionHide: 'scale'; with: [
						html qColor vModel: 'color' ] ] ] ] ]
]

{ #category : #'demo - example' }
QuasarDemoComponentApp >> renderExampleOn: html [

	self renderExampleColorPickerOn: html.
	self renderExampleTabPanelsOn: html.
	self renderExampleButtonToggleOn: html.
	self renderExampleTableOn: html.
	self renderExampleRadioOn: html.
	self renderExampleVueClosePopupOn: html.

	self renderExampleButtonsOn: html.
	self renderExampleCardsOn: html
]

{ #category : #'demo - example' }
QuasarDemoComponentApp >> renderExampleRadioOn: html [

	html div class: 'q-pa-md'; with: [
		html div class: 'q-gutter-sm'; with: [
			html qRadio vModel: 'shape'; val: 'line'; label: 'Line'.
			html qRadio vModel: 'shape'; val: 'rectangle'; label: 'Rectangle'.
			html qRadio vModel: 'shape'; val: 'ellipse'; label: 'Ellipse'.
			html qRadio vModel: 'shape'; val: 'polygon'; label: 'Polygon' ].
		html div class: 'q-px-sm'; with: [
			html html: 'Your selection is: <strong>{{ shape }}</strong>' ] ]
]

{ #category : #'demo - example' }
QuasarDemoComponentApp >> renderExampleTabPanelsOn: html [

	html div class: 'q-pa-md'; class: 'q-gutter-sm'; with: [
		html qCard with: [
			html qTabs vModel: 'tab'; dense; class: 'text-grey'; activeColor: 'primary'; indicatorColor: 'primary'; align: 'justify'; narrowIndicator; with: [
				html qTab name: 'mails'; label: 'Mails'.
				html qTab name: 'alarms'; label: 'Alarms'.
				html qTab name: 'movies'; label: 'Movies' ].
			html qSeparator.
			html qTabPanels vModel: 'tab'; animated; with: [
				html qTabPanel name: 'mails'; with: [
					html div class: 'text-h6'; with: 'Mails'.
					html text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.' ].
				html qTabPanel name: 'alarms'; with: [
					html div class: 'text-h6'; with: 'Alarms'.
					html text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.' ].
				html qTabPanel name: 'movies'; with: [
					html div class: 'text-h6'; with: 'Movies'.
					html text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.' ] ] ] ]
]

{ #category : #'demo - example' }
QuasarDemoComponentApp >> renderExampleTableOn: html [

	html div class: 'q-pa-md'; class: 'q-gutter-sm'; with: [
		html html: '<div class="q-pa-md">
    <q-table
      title="Treats"
      :rows="rows"
      :columns="columns"
      row-key="name"
    ></q-table>
  </div>' ]
]

{ #category : #'demo - example' }
QuasarDemoComponentApp >> renderExampleVueClosePopupOn: html [

"
<script>
import { ref } from 'vue'

export default {
  setup () {
    return {
      dialog: ref(false),
      cancelEnabled: ref(false)
    }
  }
}
</script>
"

	html div class: 'q-pa-md'; with: [
		html html: '
    <q-btn label="Open Dialog" color="primary" @click="dialog = true" />

    <q-dialog v-model="dialog" persistent>
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="signal_wifi_off" color="primary" text-color="white" />
          <span class="q-ml-sm">You are currently not connected to any network.</span>
        </q-card-section>

        <q-card-section class="row items-center">
          <q-toggle v-model="cancelEnabled" label="Cancel button enabled" />
        </q-card-section>

        <!-- Notice v-close-popup -->
        <q-card-actions align="right">
          <q-btn flat label="Cancel" color="primary" v-close-popup="cancelEnabled" :disable="!cancelEnabled" />
          <q-btn flat label="Turn on Wifi" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
' ]
]

{ #category : #rendering }
QuasarDemoComponentApp >> renderLayoutOn: html [

	html html: '<style>
.my-card {
	width: 100%;
	max-width: 250px;
}
</style>'.

	html qApp with: [
		html qLayout view: 'hHh lpR fFf'; with: [
			html qHeader with: [
				html qToolbar with: [
					html qBtn dense; flat; round; icon: 'menu'; vOnClick: 'this.$refs.leftDrawer.toggle($event)'.
					html qToolbarTitle with: [ html text: 'Quasar Component Demos' ] ] ].
			self renderLeftDrawerOn: html.
			self renderLayoutPageOn: html ] ]
]

{ #category : #rendering }
QuasarDemoComponentApp >> renderLayoutPageOn: html [

	html qPageContainer with: [
		html qPage with: [
			html div class: 'q-pa-md'; with: [
				self demoName = 'Select' ifTrue: [
					self renderDemoSelectOn: html ].
				self demoName = 'DateTime' ifTrue: [
					self renderDemoDateTimeOn: html ].
				self demoName = 'Misc' ifTrue: [
					self renderExampleOn: html ] ] ] ]
]

{ #category : #rendering }
QuasarDemoComponentApp >> renderLeftDrawerOn: html [

	html qDrawer ref: 'leftDrawer'; showIfAbove; persistent; side: 'left';
		class: 'bg-primary'; style: 'color: white';
		with: [
			html qScrollArea class: 'fit'; with: [
				"self renderNavBrandingOn: html."
				self renderNavOn: html ] ]
]

{ #category : #rendering }
QuasarDemoComponentApp >> renderNavOn: html [

	html qList with: [
		"html qItem with: [
			html span class: 'text-h6'; with: self applicationTitle ]."
		self demoNames do: [ :eachItem |
			html qItem
				qTag: 'a'; href: (html urlForAction: [ self demoName: eachItem ]);
				with: [
					html qItemSection with: eachItem ] ] ]
]

{ #category : #rendering }
QuasarDemoComponentApp >> renderQuasarSetupOn: html [

	html document addLoadScript: (JSStream on: self demoTableRefs).
	html document addLoadScript: (JSStream on: '
const { ref } = Vue
const app = Vue.createApp({
	setup () {
		const submitEmpty = ref(false);
		const submitResult = ref([]);
		return {
      preferred: ref("rock"),
      accepted: ref([]),

      options: [
        {
          label: "Rock",
          value: "rock"
        },
        {
          label: "Funk",
          value: "funk"
        },
        {
          label: "Pop",
          value: "pop"
        }
      ],

      submitEmpty,
      submitResult,

      onSubmit(evt) {
        const formData = new FormData(evt.target);
        const data = [];

        for (const [name, value] of formData.entries()) {
          data.push({
            name,
            value
          });
        }

        submitResult.value = data;
        submitEmpty.value = data.length === 0;
      },
date: ref("2019-02-01 12:44"),
color: ref("#FF00FF"),
tab: ref(''mails''),
columns,
rows,
shape: ref(''line'')}
	}
})
app.use(Quasar)
app.mount(''q-app'')')
]
