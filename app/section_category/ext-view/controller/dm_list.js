Ext.define('adm.controller.dm_list', {
    extend: 'Ext.app.Controller',
    views: [
         'dm_list.dm_center','dm_list.dm_list','dm_list.dm_west'
    ],
    stores: [
        //'dmcenter','dmeast'
    ],
    refs: [
      {
         ref: 'dwe', selector: 'dmcenter'
      },
      {
         ref: 'tree', selector: 'dmwest'
      },
   ],
    //models: ['dmwest','dmeast'],  
    init: function() {
       var me = this;
        
       this.control({

            'dmwest dataview': {
               itemclick: me.showAlias
            },
           
        });
    },
    onLaunch: function() {
         
         

    },
   
    showAlias: function(){
       
  

    },
    

});
