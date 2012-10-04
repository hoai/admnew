Ext.define('adm.controller.dm_list', {
    extend: 'Ext.app.Controller',
    views: [
        'dm_list.dm_west','dm_list.dm_center','dm_list.dm_list','dm_list.dm_east'
    ],
    stores: [
        'dmwest','dmeast'
    ],
    refs: [{
         ref: 'dw', selector: 'dmwest'
      },
      {
         ref: 'tree', selector: 'dmcenter'
      },
      {
         ref: 'dwe', selector: 'dmeast'
      },
   ],
    models: ['dmwest','dmeast'],  
    init: function() {
       var me = this;
        
       this.control({ 
            'dmwest toolbar[dock=top] button[action=add]': {
               click: me.addRecord
            },
            'dmwest toolbar[dock=top] button[action=delete]': {
               click: me.deleteRecord
            },
            
            'dmeast toolbar[dock=top] button[action=add]': {
               click: me.addRecordAlias
            },
            'dmeast toolbar[dock=top] button[action=delete]': {
               click: me.deleteRecordAlias
            },
            'dmcenter dataview': {
               itemclick: me.showAlias
            },
            'dmwest dataview': {
               itemclick: me.showTree
            },
        });
    },
    onLaunch: function() {
         var _grid_ws =  this.getDw();
         //console.log(this);
         //console.log(_grid_ws);
         var sm = _grid_ws.getSelectionModel();
         var _store_ws = this.getDmwestStore();
         _grid_ws.on('edit', function() {
            var record = sm.getSelection();
            _store_ws.sync();
            _store_ws.remove(record);
            _store_ws.load();
         });
         
         
         var _grid_es =  this.getDwe();
         var sm = _grid_es.getSelectionModel();
         var _store_es = this.getDmeastStore();
         _grid_es.on('edit', function() {
            var record = sm.getSelection();
            _store_es.sync();
            _store_es.remove(record);
            _store_es.load();
         });
         

    },
    showTree: function(){
          /*
       var tree =  this.getTree();
       var record = tree.getSelectionModel().getLastSelected();
       var owner_id  = record.get('id');
       var _grid_es =  this.getDwe();
       _grid_es.owner_id = owner_id;
       
       var _store_es = this.getDmeastStore();
       
       var proxy = _store_es.getProxy() ;               
       proxy.setExtraParam('owner_id',owner_id)
       _store_es.load();
         * */
    
       var _grid_ws =  this.getDw();
       var record = _grid_ws.getSelectionModel().getLastSelected();
       var owner_id  = record.get('id');   
   

       
       var tree       =  this.getTree();       
       var treeStore  = tree.getStore();
       tree.grid_id   = owner_id;
       treeStore.getProxy().setExtraParam('grid_id',owner_id);
       console.log(treeStore.getProxy());
       tree.getStore().load();

    },
    
    showAlias: function(){
       
       var tree =  this.getTree();
       var record = tree.getSelectionModel().getLastSelected();
       var owner_id  = record.get('id');
       var _grid_es =  this.getDwe();
       _grid_es.owner_id = owner_id;
       
       var _store_es = this.getDmeastStore();
       
       var proxy = _store_es.getProxy() ;               
       proxy.setExtraParam('owner_id',owner_id)
       _store_es.load();
       
       /*
       var _grid_ws =  this.getDw();
       var record = _grid_ws.getSelectionModel().getLastSelected();
       var owner_id  = record.get('id');      
       
       * */
       
       /*
        * var tree =  this.getTree();       
       var treeStore = tree.getStore();
       treeStore.getProxy().setExtraParam('owner_id',owner_id);
       console.log(treeStore.getProxy());
       * 
       * */

    },
    
    deleteRecord: function(){  
         var _grid_ws      =  this.getDw();
         var rowEditing    =  _grid_ws.getPlugin('rowEditing');
         var sm            =  _grid_ws.getSelectionModel();
         var _store_ws     = this.getDmwestStore();        
         var sm            = _grid_ws.getSelectionModel();
         
         rowEditing.cancelEdit();
         
         Ext.Msg.show({
              title:'Delete Record?',
              msg: 'You are deleting a record permanently, this cannot be undone. Proceed?',
              buttons: Ext.Msg.YESNO,
              icon: Ext.Msg.QUESTION,
              fn: function(btn){
                  if(btn === 'yes') {
                     _store_ws.remove(sm.getSelection());
                     _store_ws.sync();
                     Ext.hoai.msg('success','have done');
                  }
              }
         });
    },
    addRecord: function() {
               var _grid_ws =  this.getDw();
               var rowEditing =  _grid_ws.getPlugin('rowEditing');
               
               rowEditing.cancelEdit();
               var _store_ws = this.getDmwestStore();
               
               
               var _model_ws = this.getDmwestModel();
               var record = Ext.create(_model_ws);
                _store_ws.insert(0, record);
                
               rowEditing.startEdit(0, 0);
               
					
               
               
   },
    addRecordAlias: function() {
               var _grid_ws =  this.getDwe();
               if(_grid_ws.owner_id == undefined) return ;
               var rowEditing =  _grid_ws.getPlugin('rowEditing');
               
               rowEditing.cancelEdit();
               var _store_ws = this.getDmeastStore();
               
               //var proxy = _store_ws.getProxy() ;
               
               //proxy.setExtraParam('owner_id',_grid_ws.owner_id)
               //console.log(proxy);
               var _model_ws = this.getDmeastModel();
               var record = Ext.create(_model_ws);
               record.set('owner_id',_grid_ws.owner_id);
                _store_ws.insert(0, record);
                
               rowEditing.startEdit(0, 0);
               
					
               
               
   },
    deleteRecordAlias: function(){  
         var _grid_ws      =  this.getDwe();
         var rowEditing    =  _grid_ws.getPlugin('rowEditing');
         var sm            =  _grid_ws.getSelectionModel();
         var _store_ws     = this.getDmeastStore();        
         var sm            = _grid_ws.getSelectionModel();
         
         rowEditing.cancelEdit();
         
         Ext.Msg.show({
              title:'Delete Record?',
              msg: 'You are deleting a record permanently, this cannot be undone. Proceed?',
              buttons: Ext.Msg.YESNO,
              icon: Ext.Msg.QUESTION,
              fn: function(btn){
                  if(btn === 'yes') {
                     _store_ws.remove(sm.getSelection());
                     _store_ws.sync();
                     Ext.hoai.msg('success','have done');
                  }
              }
         });
    },
    
   
});
