
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
            ]

   
});
