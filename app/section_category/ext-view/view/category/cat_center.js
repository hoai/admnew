Ext.require([
    'Ext.form.*',
    'Ext.data.*',
    'Ext.grid.*',
]);
Ext.create('Ext.data.Store', {
    storeId:'simpsonsStore',
    fields:['name', 'email', 'phone'],
    data:{'items':[
        { 'name': 'Lisa', 'email': '',  "phone":"555-111-1224"  },
        { 'name': 'Bart',  'email': '',  "phone":"555-222-1234" },
        { 'name': 'Homer', 'email': '',  "phone":"555-222-1244"  },
        { 'name': 'Marge', 'email': '', "phone":"555-222-1254"  },
    ]},
    proxy: {
        type: 'memory',
        reader: {
            type: 'json',
            root: 'items'
        }
    }
});

Ext.define('adm.view.category.cat_center' ,{
    extend: 'Ext.tab.Panel',
    alias : 'widget.catcenter',
    region: 'center',
    items: [
       {
          xtype: 'wordforms',
       },
       {
          xtype:'externalDict',
       },
       {
          xtype: 'dictionary',
       }
    ],
    initComponent: function() {         
        
        this.callParent(arguments);
    }
});
