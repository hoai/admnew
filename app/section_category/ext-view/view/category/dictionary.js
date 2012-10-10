Ext.define('adm.view.category.dictionary' ,
{
      extend: 'Ext.panel.Panel',
      alias : 'widget.dictionary',
      title: 'Словари',
     layout : 'border',
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
       }); 
       

