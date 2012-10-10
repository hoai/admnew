
Ext.define('adm.view.dict_group.values_dict' ,{
   extend: 'Ext.grid.Panel',
   alias : 'widget.values_dict',
   title: 'Значение',
   anchor: '100% 50%',
   border: false,
   //store: Ext.data.StoreManager.lookup('simpsonsStore'),
   columns: [
        { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
        { text: 'Подключить', dataIndex: 'email'},
        { text: 'Наследовать', dataIndex: 'email'},
        
    ]

   
});
