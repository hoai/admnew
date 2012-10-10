Ext.define('adm.controller.cat_list', {
    extend: 'Ext.app.Controller',
    views: [
         'category.cat_center','category.cat_list','category.cat_west',
         'category.wordforms','category.externalDict','category.dictionary',
    ],
    stores: [
        //'dmcenter','dmeast'
    ],
    refs: [
      {
         ref: 'dwe', selector: 'catcenter'
      },
      {
         ref: 'tree', selector: 'catwest'
      },
   ],
    //models: ['dmwest','dmeast'],  
    init: function() {
       var me = this;
        
       this.control({

            'catwest dataview': {
               itemclick: me.showAlias
            },
           
        });
    },
    onLaunch: function() {
         
         

    },
   
    showAlias: function(){
       
  

    },
    

});
