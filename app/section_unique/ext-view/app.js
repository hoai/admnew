Ext.require([
       'Ext.grid.*',
       'Ext.data.*',
       'Ext.ux.RowExpander',
       'Ext.selection.CheckboxModel'
   ]);
Ext.application({
   name: 'adm',
   appFolder: path_app,
   controllers: [
      //'cat_list'
   ],
    autoCreateViewport: false,
   launch: function() {
     
     var gird =  Ext.create('Ext.ux.treeAdm',{
         title: 'Tree Panel',
         classApi: dmList,

      });
   
      Ext.create('Ext.panel.Panel', {            
         layout: 'fit',
         renderTo: 'app',
         border:false,
         cls:'padding:0;margin-left:210;margin-left:0;',
         width: width,
         height: height,
         items:[            
            gird          
         ]
      });


   }
});

