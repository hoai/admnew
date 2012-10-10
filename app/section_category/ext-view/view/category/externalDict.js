Ext.define('adm.view.category.externalDict',{
   extend: 'Ext.grid.Panel',
   alias: 'widget.externalDict',
   title: 'Внешние словари',
   store: Ext.data.StoreManager.lookup('simpsonsStore'),
   columns: [
        { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
        { text: 'Подключить', dataIndex: 'email'},
        { text: 'Наследовать', dataIndex: 'email'},
        
    ], 
   
   
});
