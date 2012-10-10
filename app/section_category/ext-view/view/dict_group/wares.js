
Ext.define('adm.view.dict_group.wares' ,{
   extend: 'Ext.grid.Panel',
   alias : 'widget.wares',
  title: 'Неразобранные товары',
   region: 'east',
   //border: false,
   width: 200,
   collapsible: true,
   collapsed: true,

         //store: Ext.data.StoreManager.lookup('simpsonsStore'),
         columns: [
              { text: 'Характеристика',  dataIndex: 'name', flex: 1 },
              { text: 'Подключить', dataIndex: 'email'},
              { text: 'Наследовать', dataIndex: 'email'},
              
          ],

});
