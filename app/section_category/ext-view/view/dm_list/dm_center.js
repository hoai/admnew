Ext.require([
    'Ext.form.*',
    'Ext.data.*',
    'Ext.grid.*',
]);
Ext.create('Ext.data.Store', {
    storeId:'simpsonsStore',
    fields:['name', 'email', 'phone'],
    data:{'items':[
        { 'name': 'Lisa', 'email': '',  "phone":"555-111-1224"  },
        { 'name': 'Bart',  'email': '',  "phone":"555-222-1234" },
        { 'name': 'Homer', 'email': '',  "phone":"555-222-1244"  },
        { 'name': 'Marge', 'email': '', "phone":"555-222-1254"  },
    ]},
    proxy: {
        type: 'memory',
        reader: {
            type: 'json',
            root: 'items'
        }
    }
});

Ext.define('adm.view.dm_list.dm_center' ,{
    extend: 'Ext.tab.Panel',
    alias : 'widget.dmcenter',
    region: 'center',
    items: [
       {
           title: 'Словоформы',
           layout : 'border',
           items:[
               {
                  region: 'north',
                  height: 300,
                  title: 'Словоформы',
                  xtype : 'form',
                  labelWidth:    150,
                  border:        false,
                  bodyStyle:     'padding:10px',
                  defaultType:   'textfield',
                  items:         [
                  {
                     name:          'node_id',
                     hidden:        true
                  },
                  { 
                     fieldLabel:    'Краткий заголовок',
                     name:          'name',
                     width:         307,
                     allowBlank:    false,
                     hidden:        true
                  },
                  {
                     //title:          'Падежи',
                     //width:          700,
                     xtype:         'fieldset',
                     layout:        'column',
                     columnSpacing: 3,
                     defaults:      { width: 360, xtype: 'fieldset' },
                     items: [{
                        width:         '100%',
                        columnWidth:   .6,
                        layout:        'form',
                        xtype:         'fieldset',
                        labelWidth:    140,
                        autoWitdh:     true,
                        border:        false,
                        title:         '<span style="padding-left:145px">Eдинственное число</span>',
                        defaults:      { xtype: 'textfield', width: 180 },
                        items: [{ 
                           fieldLabel:    '<span style="text-decoration:underline">Именительный</span>', 
                           name:          'singular_nominative' 
                        },
                        { 
                           fieldLabel:    'Родительный', 
                           name:          'singular_genitive' 
                        },
                        { 
                           fieldLabel:    'Дательный', 
                           name:          'singular_dative' 
                        },
                        { 
                           fieldLabel:    'Винительный', 
                           name:          'singular_accusative' 
                        },
                        { 
                           fieldLabel:    'Творительный', 
                           name:          'singular_instrumentative' 
                        },
                        { 
                           fieldLabel:    'Предложный', 
                           name:          'singular_preposition' 
                        }]
                     },
                     {
                        columnWidth:   .4,
                        layout:        'form',
                        xtype:         'fieldset',
                        labelWidth:    1,
                        autoWitdh:     true,
                        border:        false,
                        title:         'Множественное число',
                        defaults:      { xtype: 'textfield', hideLabel: true, width: 180 },
                        items: [{ 
                           fieldLabel:    'Именительный', 
                           name:          'multiple_nominative' 
                        },
                        { 
                           fieldLabel:    'Родительный', 
                           name:          'multiple_genitive' 
                        },
                        { 
                           fieldLabel:    'Дательный', 
                           name:          'multiple_dative' 
                        },
                        { 
                           fieldLabel:    'Винительный', 
                           name:          'multiple_accusative' 
                        },
                        { 
                           fieldLabel:    'Творительный', 
                           name:          'multiple_instrumentative' 
                        },
                        { 
                           fieldLabel:    'Предложный', 
                           name:          'multiple_preposition' 
                        }]
                     }]
                  }],
                  
         
                     buttons:    [{
                           text:       'Яндекс',
                           handler:    function(button, e) {
                              /*var form = CatalogEditorForm.getForm();
                              var node_id = form.findField('node_id').getValue();
                              var node_name = form.findField('singular_nominative').getValue();
                              form.load({
                                 url:     'ajaxData.php?m=forms&c=yandex',
                                 params:  {
                                    id:         node_id,
                                    name:       node_name
                                 },
                                 method:  'POST'
                              });*/
                           }
                        },
                        {
                           text:    'phpMorphy',
                           handler:    function(button, e) {
                              /*var form = CatalogEditorForm.getForm();
                              var node_id = form.findField('node_id').getValue();
                              var node_name = form.findField('singular_nominative').getValue();
                              form.load({
                                 url:     'ajaxData.php?m=forms&c=morphy',
                                 params:  {
                                    id:         node_id,
                                    name:       node_name
                                 },
                                 method:  'POST'
                              });
                              * */
                           }
                        },
                        {
                           text:             'Сохранить',
                           iconCls:          'icon-save',
                           loadingMessage:   'Сохраняю...',
                           handler:          function(button, e) {
                              /*var form = CatalogEditorForm.getForm();
                              var node_id = form.findField('node_id').getValue();
                              var node_name = form.findField('singular_nominative').getValue();
                              if (node_id > 0) {
                                 form.submit({
                                    url:        'ajaxData.php?m=forms&a=update',
                                    params:     { id: node_id },
                                    method:     'POST',
                                    waitMsg:    'Сохраняю...',
                                    success:    function(response, e) {
                                       form.findField('name').setValue(node_name);
                                       var selected = Ext.getCmp('CatalogTreePanel').getNodeById(node_id);
                                       selected.setText(node_name);
                                    }
                                 });
                              }
                              * */
                           }
                        }
                     ]
                  
               },{
                  region:'center',
                  title: 'Синонимы',
                  xtype: 'grid',
                  store: Ext.data.StoreManager.lookup('simpsonsStore'),
                  columns: [
                       { text: 'Синонимы',  dataIndex: 'name', flex: 1 },
                       { text: 'Действие', dataIndex: 'email'}
                   ],
                 
                  
                  
               }
           
           
           ]
       }, 
       {
            title: 'Внешние словари',
            xtype: 'grid',
            store: Ext.data.StoreManager.lookup('simpsonsStore'),
            columns: [
                 { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
                 { text: 'Подключить', dataIndex: 'email'},
                 { text: 'Наследовать', dataIndex: 'email'},
                 
             ],        
       },
       {
           title: 'Словари', 
           layout: 'border',
           
           items:[
               {
                  region: 'west',
                  layout: 'anchor',
                  border: false,
                  width: 450,
                  items:[
                     {
                        title: 'Параметры каталога',   
                        xtype: 'grid',
                        anchor: '100% 50%',
                        //store: Ext.data.StoreManager.lookup('simpsonsStore'),
                        columns: [
                             { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
                             { text: 'Подключить', dataIndex: 'email'},
                             { text: 'Наследовать', dataIndex: 'email'},
                             
                         ],
                                    
                        
                     },{
                        title: 'Значение',
                        anchor: '100% 50%',
                        border: false,
                        xtype: 'grid',
                        //store: Ext.data.StoreManager.lookup('simpsonsStore'),
                        columns: [
                             { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
                             { text: 'Подключить', dataIndex: 'email'},
                             { text: 'Наследовать', dataIndex: 'email'},
                             
                         ],
                     }
                  
                  ]
                  
               },
               {
                  region: 'center',
                  layout: 'anchor',
                  border: false,
                  //width: 200,
                  items:[
                     {
                        title: 'Синонимы',
                        anchor: '100% 50%',                       
                        border: false,
                        xtype: 'grid',
                        //store: Ext.data.StoreManager.lookup('simpsonsStore'),
                        columns: [
                             { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
                             { text: 'Подключить', dataIndex: 'email'},
                             { text: 'Наследовать', dataIndex: 'email'},
                             
                         ],
                     },{
                        title: 'Синонимы значение',
                        anchor: '100% 50%',
                        xtype: 'grid',
                        //store: Ext.data.StoreManager.lookup('simpsonsStore'),
                        columns: [
                             { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
                             { text: 'Подключить', dataIndex: 'email'},
                             { text: 'Наследовать', dataIndex: 'email'},
                             
                         ],
                        
                     }
                  
                  ]
                  
               },
               {
                  title: 'Неразобранные товары',
                  region: 'east',
                  //border: false,
                  width: 200,
                  collapsible: true,
                  collapsed: true,
                  xtype: 'grid',
                        //store: Ext.data.StoreManager.lookup('simpsonsStore'),
                        columns: [
                             { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
                             { text: 'Подключить', dataIndex: 'email'},
                             { text: 'Наследовать', dataIndex: 'email'},
                             
                         ],
               }
           
           ]
                  
       }    
    ],
    initComponent: function() {
         
        
        this.callParent(arguments);
    }
});
