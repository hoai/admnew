Ext.define('adm.controller.cat_list', {
    extend: 'Ext.app.Controller',
    views: [
         'category.cat_center','category.cat_list','category.cat_west',
         'category.wordforms','category.externalDict','category.dictionary',
         'dict_group.settings_dict','dict_group.values_dict',
         'dict_group.alias',
         'dict_group.values_alias',
         'dict_group.wares',
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
