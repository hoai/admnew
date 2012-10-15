Ext.define('Ext.ux.gridGroupEditAdm', {
        
        extend: 'Ext.grid.Panel',
        /*requires: [

         ],*/
        alias : 'widget.gridEditAdm',
        id:    'button-grid',
        
        columnLines: true,  
        title    : 'grid editor',   
        frame: true,
        width: 600,
        height: 300,
        iconCls     :'icon-grid',
        viewConfig: {
            stripeRows: true
        },
        
        group: true,
        searchValue: null,
        /**
         * @public
         * Название field поиска
         */
        searchField: null,
        /**
        * @private
        * Case sensitive mode.
        */
        caseSensitive: false,
       /**
        * @private
        * The generated regular expression used for searching.
        */
        searchRegExp: null,
        plugins : [],        
        /**
         * add Row actions in group column
         * {
        	xtype: 'rowactions',
         flex: 0.3,
         header: 'Действие',
         //actionEvent: 'mouseover',
    		actions: [{ 
    			iconCls: 'icon-add', 
    			qtip: 'Action on Row', 
            align: 'right', 
    			callback: function(grid, record, action, idx, col, e, target) { 
    				Ext.Msg.alert('Row Action', record.get('name')); 
    			} 
    		}],
    		keepSelection: true,
         groupActions: [{ 
    	    	iconCls: 'icon-grid', 
    	    	qtip: 'Action on Group', 
    	    	align: 'right', 
    	    	callback: function(grid, records, action, groupValue) { 
    	    		Ext.Msg.alert('Group Action', groupValue); 
    	    	} 
    	    }]
        }
         * 
         * 
         * 
         * 
         * 
         * */
        initComponent: function() {
        // constructor: function(config) {
            //console.log(config);
            var me = this;
            var bottom = {
                                 xtype: 'toolbar',
                                 dock: 'bottom',
                                 ui: 'footer',
                                 layout: {
                                     pack: 'center'
                                 },
                                 items: [{
                                     minWidth: 80,
                                     text: 'Save'
                                 },{
                                     minWidth: 80,
                                     text: 'Cancel'
                                 }]
                             };
            var dockedItems = [/** bottom,*/ {
                                 xtype: 'toolbar',
                                 items: [{
                          
                                     tooltip:'Add record',
                                     iconCls: 'icon-add',
                                     text: 'Add',
                                      handler: this.addRow
                                 },'-',{
                                     itemId: 'remove',
                                     tooltip:'Remove the selected item',                
                                     iconCls: 'icon-delete',
                                     text: 'Delete',
                                     disabled: true,
                                     handler: this.removeRow,
                                 },'-',
                                    'Search',{
                                      xtype: 'textfield',
                                      name: 'searchField',
                                      hideLabel: true,
                                      width: 200,
                                      listeners: {
                                          specialkey: {
                                              fn: me.search,
                                              scope: this,
                                              //buffer: 100
                                          }
                                      }
                                    
                                    
                                 }
                                 ]
                             }] ; 
            me.dockedItems = dockedItems;
            var selModel = Ext.create('Ext.selection.CheckboxModel', {
                 listeners: {
                     selectionchange: function(sm, selections) {
                         me.down('#remove').setDisabled(selections.length == 0);
                     }
                 }
             });
            me.selModel    = selModel;            
            var rowEditing = Ext.create('Ext.grid.plugin.RowEditing', {
               clicksToEdit: 2,             
               pluginId: 'rowEditing'
            });
            
            //me.plugins     = [rowEditing];         
            
            
            var groupingFeature = Ext.create('Ext.grid.feature.Grouping',{
                 groupHeaderTpl: '{name} ({rows.length})'
            });
            me.features =  [groupingFeature];
            this.callParent(arguments);
            //me.superclass.constructor.apply(this,arguments);
         },
         addRow: function(){
            var me = this.up('toolbar').up('gridpanel');      
            var rowEditing =  me.getPlugin('rowEditing');               
            rowEditing.cancelEdit();
            
            var store = me.getStore();               
            var model = store.model;
           
            var record = Ext.create(model);
            store.insert(0, record);
                
            rowEditing.startEdit(0, 0);
         },
         removeRow: function (){
            var me = this.up('toolbar').up('gridpanel');      
            var rowEditing =  me.getPlugin('rowEditing');               
            rowEditing.cancelEdit();
            var store = me.getStore();   
            var sm   = me.getSelectionModel();
            
            Ext.Msg.show({
              title:'Удалить строки',
              msg: 'Вы хотите удалить?',
              buttons: Ext.Msg.YESNO,
              icon: Ext.Msg.QUESTION,
              fn: function(btn){
                  if(btn === 'yes') {
                     store.remove(sm.getSelection());
                     store.sync();
                     Ext.hoai.msg('Статус','Успешно удалил');
                  }
              }
         });
            
         },
         search: function (field, e){
            if (e.getKey() == e.ENTER) {
               var me = this;
               me.searchValue  = me.down('textfield[name=searchField]').getValue();
               
               var store = me.getStore();
               
               //console.log(me); 
               if (me.searchValue.length > 0 ) {
                 // me.searchRegExp = new RegExp(me.searchValue, 'g' + (me.caseSensitive ? '' : 'i'));
                  
                  /*Если searchField null то выбираем первый столбец                  * 
                   * */
                    //  
                  if(me.searchField == null){                     
                     me.searchField  = me.columns[1].dataIndex;                     
                  }
                  store.filter([
                      {filterFn: function(item) { return item.get(me.searchField).indexOf(me.searchValue) > -1; }}
                  ]);
               }else{
                  store.clearFilter(false);
               }
            
            }
         },
    });
    
