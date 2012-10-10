
Ext.define('adm.view.dict_group.settings_dict' ,{
   extend: 'Ext.grid.Panel',
   alias : 'widget.settings_dict',
   title: 'Параметры каталога',   
   anchor: '100% 50%',
   //store: Ext.data.StoreManager.lookup('simpsonsStore'),
   columns: [
        { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
        { text: 'Подключить', dataIndex: 'email'},
        { text: 'Наследовать', dataIndex: 'email'},
        
    ],

   
});
