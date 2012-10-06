Ext.define('adm.view.dm_list.dm_east' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.dmeast',
    title : 'Синонимы',
    store: 'dmeast',
    region: 'east',
    width: 200,
    dockedItems: [{
      xtype: 'toolbar',
      dock: 'top',
      items: [
         {
             iconCls: 'icon-add',
             text: 'Add',
             action: 'add',
             
             /*handler: function() {
                rowEditing.cancelEdit();
                // create a blank record from PersonalInfo
                var record = Ext.create('dmwest');
                //insert at top
                store.insert(0, record);
                //edit at row 0
                rowEditing.startEdit(0, 0);
            }*/
            },
            {
             iconCls: 'icon-delete',
             text: 'Delete',
             action: 'delete',
              /*
             handler: function() {
                 rowEditing.cancelEdit();
                 var sm = grid.getSelectionModel();
                 store.remove(sm.getSelection());
                 store.sync();
             }*/
         }]
   }],
    initComponent: function() {
         var rowEditing = Ext.create('Ext.grid.plugin.RowEditing', {
             clicksToEdit: 2,
             //autoCancel: false,
             pluginId: 'rowEditing'
         });

        this.columns = [
            {header: 'id',  dataIndex: 'id',  flex: 1},
            {header: 'name', dataIndex: 'name', flex: 3,            
               editor: {
                  xtype: 'textfield',
                  allowBlank: false,                  
               }
            },
            {header: 'owner_id',  dataIndex: 'owner_id',  flex: 1},
        ];
        this.plugins = [rowEditing];
        
        this.callParent(arguments);
    }
});
