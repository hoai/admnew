Ext.define('adm.view.dm_list.dm_list' ,{
    extend: 'Ext.panel.Panel',
    alias : 'widget.dmlist',
    layout: 'border',
    items:[
         {xtype: 'dmwest'},         
         {xtype: 'dmcenter'},
         

         ],


});