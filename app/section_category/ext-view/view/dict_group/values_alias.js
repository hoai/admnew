
Ext.define('adm.view.dict_group.values_alias' ,{
   extend: 'Ext.grid.Panel',
   alias : 'widget.values_alias',
   title: 'Синонимы значение',
   anchor: '100% 50%',
   //store: Ext.data.StoreManager.lookup('simpsonsStore'),
   columns: [
        { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
        { text: 'Подключить', dataIndex: 'email'},
        { text: 'Наследовать', dataIndex: 'email'},
        
    ],

});
