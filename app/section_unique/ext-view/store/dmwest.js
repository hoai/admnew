Ext.define('adm.store.dmwest', {
    extend: 'Ext.data.Store',  
    model: 'adm.model.dmwest',
    //model: ['dm_west'], 
    //fields: ['id', 'name'],
    autoLoad: true,
    proxy : {
            type: 'direct',
            //directFn: dmList.getResults,
            api:{
               create: dmList.createRecord,
               read: dmList.getResults,
               update:dmList.updateRecords,
               destroy:dmList.destroyRecord,
               
            }
    },
    constructor : function(config) {
        config = config || {};

        this.callParent([config]);        
       // console.log(dmList);
    }
});
