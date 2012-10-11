
Ext.define('adm.view.dict_group.settings_dict' ,{
   extend: 'Ext.grid.Panel',
   alias : 'widget.settings_dict',
   title: 'Параметры каталога',   
   anchor: '100% 50%',
   //store: Ext.data.StoreManager.lookup('simpsonsStore'),

    columns: [
            { text: 'id', dataIndex: 'id', hidden: true },//, hideable:false
            { text: 'group_id', dataIndex: 'group_id', hidden:  true, hideable:   true, groupable:  true, },
            { text: 'Группа', dataIndex:   'group_name', hidden:   true, hideable:   true},
            { text: 'catalog_id', dataIndex: 'catalog_id', hidden: true },
            { 
               text:     'Название',
               tooltip:    'Название параметра каталога',
               dataIndex:  'name',
               //editor:     new Ext.form.TextField({allowBlank: false, maxlength: '256'}),
               width:      100,
               sortable:   true
            },
            { 
               text:        'Коротко',
               tooltip:       'Краткое название',
               dataIndex:     'name_short',
               //editor:        new Ext.form.TextField({allowBlank: false, maxlength: '256'}),
               width:         80,
               sortable:      true
            },
            {
               text:        'Метрика',
               tooltip:       'Единица измерения',
               dataIndex:     'unit_id',
               name:          'unit_name',
               //editor:        groupingComboUnits,
               //renderer:      Ext.util.Format.comboRenderer(groupingComboUnits),
               width:         50
            },
            {
               text:        'Тип поля',
               dataIndex:     'type',
               /*editor:        comboFieldType,*/
               //renderer:      Ext.util.Format.comboRenderer(comboFieldType),
               valueField:    'id',
               displayField:  'text',
               width:         50
            },
            {
               text:        'Наследовать?',
               tooltip:       'Наследовать параметр?',
               dataIndex:     'inherit',
               //xtype:         'checkcolumn',
               /*editor:        {
                  xtype:         'checkbox'
               },*/
               width:         40
            },
            {
               text:        'Проверять диапазон?',
               tooltip:       'Проверять диапазон значений?',
               dataIndex:     'check_range',
               //xtype:         'checkcolumn',
               /*editor:        {
                  xtype:         'checkbox'
               },*/
               width:         40
            },
            
            { text: 'Наследовано', dataIndex: 'inherited', hidden: true }
            ],
            
   initComponent: function() {       
         // wrapped in closure to prevent global vars.
    Ext.define('Restaurant', {
        extend: 'Ext.data.Model',
        fields: ['name', 'cuisine']
    });

    var Restaurants = Ext.create('Ext.data.Store', {
        storeId: 'restaraunts',
        model: 'Restaurant',
        sorters: ['cuisine','name'],
        groupField: 'cuisine',
        data: [{
            name: 'Cheesecake Factory',
            cuisine: 'American'
        },{
            name: 'University Cafe',
            cuisine: 'American'
        },{
            name: 'Slider Bar',
            cuisine: 'American'
        },{
            name: 'Shokolaat',
            cuisine: 'American'
        },{
            name: 'Gordon Biersch',
            cuisine: 'American'
        },{
            name: 'Crepevine',
            cuisine: 'American'
        },{
            name: 'Creamery',
            cuisine: 'American'
        },{
            name: 'Old Pro',
            cuisine: 'American'
        },{
            name: 'Nola\'s',
            cuisine: 'Cajun'
        },{
            name: 'House of Bagels',
            cuisine: 'Bagels'
        },{
            name: 'The Prolific Oven',
            cuisine: 'Sandwiches'
        },{
            name: 'La Strada',
            cuisine: 'Italian'
        },{
            name: 'Buca di Beppo',
            cuisine: 'Italian'
        },{
            name: 'Pasta?',
            cuisine: 'Italian'
        },{
            name: 'Madame Tam',
            cuisine: 'Asian'
        },{
            name: 'Sprout Cafe',
            cuisine: 'Salad'
        },{
            name: 'Pluto\'s',
            cuisine: 'Salad'
        },{
            name: 'Junoon',
            cuisine: 'Indian'
        },{
            name: 'Bistro Maxine',
            cuisine: 'French'
        },{
            name: 'Three Seasons',
            cuisine: 'Vietnamese'
        },{
            name: 'Sancho\'s Taquira',
            cuisine: 'Mexican'
        },{
            name: 'Reposado',
            cuisine: 'Mexican'
        },{
            name: 'Siam Royal',
            cuisine: 'Thai'
        },{
            name: 'Krung Siam',
            cuisine: 'Thai'
        },{
            name: 'Thaiphoon',
            cuisine: 'Thai'
        },{
            name: 'Tamarine',
            cuisine: 'Vietnamese'
        },{
            name: 'Joya',
            cuisine: 'Tapas'
        },{
            name: 'Jing Jing',
            cuisine: 'Chinese'
        },{
            name: 'Patxi\'s Pizza',
            cuisine: 'Pizza'
        },{
            name: 'Evvia Estiatorio',
            cuisine: 'Mediterranean'
        },{
            name: 'Cafe 220',
            cuisine: 'Mediterranean'
        },{
            name: 'Cafe Renaissance',
            cuisine: 'Mediterranean'
        },{
            name: 'Kan Zeman',
            cuisine: 'Mediterranean'
        },{
            name: 'Gyros-Gyros',
            cuisine: 'Mediterranean'
        },{
            name: 'Mango Caribbean Cafe',
            cuisine: 'Caribbean'
        },{
            name: 'Coconuts Caribbean Restaurant &amp; Bar',
            cuisine: 'Caribbean'
        },{
            name: 'Rose &amp; Crown',
            cuisine: 'English'
        },{
            name: 'Baklava',
            cuisine: 'Mediterranean'
        },{
            name: 'Mandarin Gourmet',
            cuisine: 'Chinese'
        },{
            name: 'Bangkok Cuisine',
            cuisine: 'Thai'
        },{
            name: 'Darbar Indian Cuisine',
            cuisine: 'Indian'
        },{
            name: 'Mantra',
            cuisine: 'Indian'
        },{
            name: 'Janta',
            cuisine: 'Indian'
        },{
            name: 'Hyderabad House',
            cuisine: 'Indian'
        },{
            name: 'Starbucks',
            cuisine: 'Coffee'
        },{
            name: 'Peet\'s Coffee',
            cuisine: 'Coffee'
        },{
            name: 'Coupa Cafe',
            cuisine: 'Coffee'
        },{
            name: 'Lytton Coffee Company',
            cuisine: 'Coffee'
        },{
            name: 'Il Fornaio',
            cuisine: 'Italian'
        },{
            name: 'Lavanda',
            cuisine: 'Mediterranean'
        },{
            name: 'MacArthur Park',
            cuisine: 'American'
        },{
            name: 'St Michael\'s Alley',
            cuisine: 'Californian'
        },{
            name: 'Cafe Renzo',
            cuisine: 'Italian'
        },{
            name: 'Osteria',
            cuisine: 'Italian'
        },{
            name: 'Vero',
            cuisine: 'Italian'
        },{
            name: 'Cafe Renzo',
            cuisine: 'Italian'
        },{
            name: 'Miyake',
            cuisine: 'Sushi'
        },{
            name: 'Sushi Tomo',
            cuisine: 'Sushi'
        },{
            name: 'Kanpai',
            cuisine: 'Sushi'
        },{
            name: 'Pizza My Heart',
            cuisine: 'Pizza'
        },{
            name: 'New York Pizza',
            cuisine: 'Pizza'
        },{
            name: 'California Pizza Kitchen',
            cuisine: 'Pizza'
        },{
            name: 'Round Table',
            cuisine: 'Pizza'
        },{
            name: 'Loving Hut',
            cuisine: 'Vegan'
        },{
            name: 'Garden Fresh',
            cuisine: 'Vegan'
        },{
            name: 'Cafe Epi',
            cuisine: 'French'
        },{
            name: 'Tai Pan',
            cuisine: 'Chinese'
        }]
    });
         var groupingFeature = Ext.create('Ext.grid.feature.Grouping',{
              groupHeaderTpl: 'Cuisine: {name} ({rows.length} Item{[values.rows.length > 1 ? "s" : ""]})'
          });
         this.features  =  [groupingFeature];
         this.iconCls   = 'icon-grid' ;
         this.store     = Restaurants;
         this.columns   =  [{
                                 text: 'Name',
                                 flex: 1,
                                 dataIndex: 'name'
                             },{
                                 text: 'Cuisine',
                                 flex: 1,
                                 dataIndex: 'cuisine'
                             }];
         this.callParent(arguments);
    }

   
});
