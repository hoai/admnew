var config = new Array();
Ext.onReady(function(){
    /* показываем/скрываем блок с индикатором загрузки */
   Ext.Ajax.on('beforerequest', function(){ Ext.get('ajaxIndicator').show(); }, this);
   Ext.Ajax.on('requestcomplete', function(){ Ext.get('ajaxIndicator').hide(); }, this);
   Ext.Ajax.on('requestexception', function(){ Ext.get('ajaxIndicator').hide(); }, this);
   /* показываем/скрываем блок с индикатором загрузки */
    var body = Ext.getBody();
    body.mask('Загружаю настройки приложения&hellip;');
    Ext.Ajax.request({
      url:           'ajaxData.php?m=main&a=get_application_config'
      ,success:      function(response) {
         config = Ext.util.JSON.decode(response.responseText);
         Ext.QuickTips.init();
         body.unmask();
         /*config.url
          * config.lang
          * config.menu = [{
             *    url: '',
             *    name: '',
             *    app: '', 
             * },{}...];
          * 
          * 
          * 
          * */
          Ext.each(config.menu,function(item){
             
             
          });
          
         
      }
      ,failure:      function() {
         body.unmask();
      }
   });

});
