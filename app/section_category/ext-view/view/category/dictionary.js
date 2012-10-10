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
               xtype: 'settings_dict',          
               
            },{
                xtype: 'values_dict', 
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
               xtype:'alias'
            },{
               xtype:'values_alias',
               
            }
         
         ]
         
      },
      {
          xtype:'wares',
      }
  
  ]               
       }); 
       

