Ext.application({
   name: 'adm',
   appFolder: path_app,
   controllers: [
      'dm_list'
   ],
    autoCreateViewport: false,
   launch: function() {
      
      Ext.create('Ext.panel.Panel', {            
         layout: 'fit',
         renderTo: 'app',
         border:false,
         cls:'padding:0;margin-left:210;margin-left:0;',
         width: width,
         height: height,
         items:[
         {
            title:   lang.dm_list ,            
            xtype:   'dmlist'
         }
         ]
      });


   }
});

