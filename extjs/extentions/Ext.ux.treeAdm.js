Ext.define('Ext.ux.treeAdm' ,{
    extend: 'Ext.tree.Panel',
    alias : 'widget.treeAdm',
    title : 'Каталог',
    rootVisible: false,
    /** @classApi name of class router 
     * */
    classApi: '',
    viewConfig: {
            plugins: {
                ptype: 'treeviewdragdrop'
            },
            listeners: {
               drop: function(node, data, overModel, dropPosition, dropFunction, eOpts) {
                     var tree       = this.ownerCt;
                     var store      = tree.getStore();
                     var order      = store.getProxy().api.order;
                     var node_id    = data.records[0].get('id');
                     var parent_id  = data.records[0].get('parentId');
         

                     var prevSiblingId = data.records[0].previousSibling ? 
                        data.records[0].previousSibling.get('id') : 0;
                     var nextSiblingId = data.records[0].nextSibling ? 
                        data.records[0].nextSibling.get('id') : 0;
                     var params = {
                           node_id:             node_id,
                           prev_sibling_id:     prevSiblingId,
                           next_sibling_id:     nextSiblingId,
                           parent_id:           parent_id
                        }
                    console.log(params);
                    order(
                         params,                
                         function(result, e){
                             var t = e.getTransaction();
                             var action = t.action; 
                             var method = t.method; 
                             if(e.status){
                                 var answer = Ext.encode(result); 
                                Ext.hoai.msg('Успешно!','переносили');
                         
                             }else{
                                 var msg = e.message; 
                             }
                         }
                         );
                    
                 }
            }
   },
    rootVisible:   true,
    dockedItems: [{
      xtype: 'toolbar',
      dock: 'top',
      items: [
         {
             iconCls: 'icon-add',
             text: 'Add',
             action: 'add',
             //hidden: true,
             handler: function() {
                var toolbar = this;
                Ext.MessageBox.prompt('Название', 'Новые группы:', 
                function(btn, text){
                  if(btn == 'ok'){
                         var tree = toolbar.up('treepanel');
                         var store = tree.getStore();
                         var selModel = tree.getSelectionModel();
                         var add = store.getProxy().api.add;
                         var node = selModel.getLastSelected();
                           
                         if (!node) {
                             return;
                         }
                           /*
                         // Feels like this should happen automatically
                         node.set('leaf', false);

                         node.appendChild({
                             leaf: true,
                             text: 'New Child'
                         });
                         * 
                         * */
                         add(
                         {'id':null,'name':text,'owner_id':node.get('id'),'grid_id': tree.grid_id},                
                         function(result, e){
                             var t = e.getTransaction();
                             var action = t.action; 
                             var method = t.method;
                             if(e.status){
                                 var answer = Ext.encode(result); 
                                 
                                  //node.collapse();
                                  //tree.getView().refresh();
                                  //node.expand();
                                  // Call load, refreshing our view when done... 
                                 var viewRefresher = function() { 
                                     tree.getView().refresh(); 
                                 }; 

                                 store.load({ 
                                     node: node, 
                                     callback: viewRefresher 
                                 }); 
                                  //tree.getLoader().load({node:node});
                                  Ext.hoai.msg('Успешно!','Добавили');
                         
                             }else{
                                 var msg = e.message; 
                             }
                         }
                         );
                     
                  }
                  else return ;     
                });
                
                   
            

                
            }
         
            },
         {
             iconCls: 'icon-edit',
             text: 'Edit',
             action: 'edit',
             disable: false,
             //hidden: true,
             handler: function() {
                var toolbar = this;
                Ext.MessageBox.prompt('Название', 'Новое название:', 
                function(btn, text){
                  if(btn == 'ok'){
                         var tree = toolbar.up('treepanel');
                         var store = tree.getStore();
                         var selModel = tree.getSelectionModel();
                         var update = store.getProxy().api.update;
                         var node = selModel.getLastSelected();

                         if (!node) {
                             return;
                         }
                         update(
                         {'id':node.get('id'),'name':text,'owner_id':node.get('id')},                
                         function(result, e){
                             var t = e.getTransaction();
                             var action = t.action; 
                             var method = t.method; 
                             if(e.status){
                                 var answer = Ext.encode(result); 
                                  tree.getView().refresh();
                                  node.set('text',text);
                                  console.log(node);
                         
                             }else{
                                 var msg = e.message; 
                             }
                         }
                         );
                     
                  }
                  else return ;     
                });
                
                   
            

                
            }
             
            },
         
         {
             iconCls: 'icon-delete',
             text: 'Delete',
             action: 'delete',
              handler: function() {
                var toolbar = this;
                Ext.MessageBox.confirm('Подтверждение', 'Уверенно удалить?', 
                function(btn, text){
                  if(btn == 'yes'){
                         var tree = toolbar.up('treepanel');
                         var store = tree.getStore();
                         var selModel = tree.getSelectionModel();
                         var remove = store.getProxy().api.remove;
                         var node = selModel.getLastSelected();

                         if (!node) {
                             return;
                         }
                         remove(
                         {'id':node.get('id'),'grid_id': tree.grid_id},                
                         function(result, e){
                             var t = e.getTransaction();
                             var action = t.action; 
                             var method = t.method; 
                             if(e.status){
                                 var answer = Ext.encode(result); 
                                  tree.getView().refresh();
                                  //node.set('text',text);
                                  //console.log(node);
                                 var viewRefresher = function() { 
                                     tree.getView().refresh(); 
                                 }; 

                                 store.load({ 
                                     node: node.parentNode, 
                                     callback: viewRefresher 
                                 }); 
                         
                             }else{
                                 var msg = e.message; 
                             }
                         }
                         );
                     
                  }
                  else return ;     
                });               
                   
            

                
            }
             
         }
         
         ,
          {
            xtype:            'textfield',
            width:             200,
            labelWidth:        40,
            fieldLabel:       'Поиск:',
            name:             'search_input',
            itemId:           'search_input',
            disabled:         false,
            enableKeyEvents:  true,
            listeners:        {
               specialkey: {
                  scope:   this,
                  fn:      function(field, e) {
                           if (e.getKey() == e.ENTER) {                              
                              var toolbar    =  field.up('toolbar');                      
                              var tree       = toolbar.up('treepanel');                                    
                              var searchVal  = field.getValue();
                              console.log(searchVal.length);
                              if (0 == searchVal.length) {
                                 tree.fireEvent('reset');
                              }
                              else {
                                 var param = {
                                          text: searchVal
                                 };
                                 tree.fireEvent('filter', param);
                              }
                           }
                  }
               }
            }
         },
         {
            text:          'Найти',
            iconCls:      'icon-find',
            name:         'search_button',
            itemId:       'search_button',
            ref:          '../searchBtn',
            disabled:     false,
            handler:       function(btn) {
               var toolbar    = btn.up('toolbar');
               var tree       = toolbar.up('treepanel');
               var searchVal  = toolbar.down('textfield[name=search_input]').getValue();
               console.log(searchVal);
               if (searchVal.length) {
                  var param = {
                     text: searchVal
                  };
                  tree.fireEvent('filter', param);
               }
               else {
                  tree.fireEvent('reset');
               }
            }
         }]

      }],
    initComponent: function() {
         /** var store = Ext.create('Ext.data.TreeStore', {
             root: {
                 expanded: true,
                 children: [
                     { text: "detention", leaf: true },
                     { text: "homework", expanded: true, children: [
                         { text: "book report", leaf: true },
                         { text: "alegrbra", leaf: true}
                     ] },
                     { text: "buy lottery tickets", leaf: true }
                 ]
             }
         });*/
        var classApi = this.classApi;
        var store =  Ext.create('Ext.data.TreeStore', {
                          proxy: {
                              type: 'direct',
                              
                              //directFn: classApi.getTree,
                              
                              api: {
                                 read:    classApi.getTree,
                                 add:     classApi.addNode,
                                 update:  classApi.updateNode,
                                 remove:  classApi.deleteNode,
                                 search:  classApi.searchNode,
                                 order:   classApi.nodeOrder,
                             },
                          },
                          root: {
                              text: 'Группа',
                              id: '0',
                              expanded: true,
                              
                          },
                          folderSort: true,
                          sorters: [{
                              property: 'text',
                              direction: 'ASC'
                          }]
                      });

         this.store = store;

         this.on({
         'filter':   {
            scope:   this,
            fn:      function(param) {  
               this.getStore().getProxy().api.read = classApi.searchNode;
               this.getStore().load({
                  params: {
                     text: encodeURIComponent(param.text),
                     'grid_id': this.grid_id
                  }
                  
               });

            }
         },
         'reset':    {
            scope:   this,
            fn:      function() {
               this.getStore().getProxy().api.read = classApi.getTree;
               this.getStore().getProxy().setExtraParam('grid_id',this.grid_id);
               this.getStore().load();
            }
         }
      });

        this.callParent(arguments);
    }
});

