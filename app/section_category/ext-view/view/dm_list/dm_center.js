Ext.define('adm.view.dm_list.dm_center' ,{
    extend: 'Ext.tab.Panel',
    alias : 'widget.dmcenter',
    region: 'center',
    items: [
       {
           title: 'Словоформы'
       }, 
       {
           title: 'Внешние словари',        
       },
       {
           title: 'Словари',        
       }    
    ],
    initComponent: function() {
         
        
        this.callParent(arguments);
    }
});
