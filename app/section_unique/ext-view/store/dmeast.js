Ext.define('adm.store.dmeast', {
    extend: 'Ext.data.Store',  
    model: 'adm.model.dmeast',
    //model: ['dm_west'], 
    //fields: ['id', 'name'],
    autoLoad: true,
    proxy : {
            type: 'direct',
            //directFn: dmList.getResults,
            api:{
               create: dmList.createRecordAlias,
               read: dmList.getResultsAlias,
               update:dmList.updateRecordsAlias,
               destroy:dmList.destroyRecordAlias,
               
            }
    },
    constructor : function(config) {
        config = config || {};

        this.callParent([config]);        
        //console.log(dmList);
    }
});
