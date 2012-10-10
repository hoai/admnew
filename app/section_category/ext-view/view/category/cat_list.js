Ext.define('adm.view.category.cat_list' ,{
    extend: 'Ext.panel.Panel',
    alias : 'widget.catlist',
    layout: 'border',
    items:[
         {xtype: 'catwest'},         
         {xtype: 'catcenter'},
         ],


});
