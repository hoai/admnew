<?php session_start(); ?>
<html>
<head>
    <title>Управлятор</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="extjs/lib/extjs/extjs-4.1.1/resources/css/ext-all.css">
    
    <link rel="stylesheet" type="text/css" href="extjs/lib/extjs/extjs-4.1.1/examples/ux/css/GroupTabPanel.css" />
    <script type="text/javascript" src="extjs/lib/extjs/extjs-4.1.1/ext-all-debug.js"></script>
    <link rel="stylesheet" type="text/css" href="extjs/lib/styles.css"/>
    <script type="text/javascript" src="extjs/js/lang.js"></script>
    <script type="text/javascript" src="extjs/js/notice.js"></script>
    <script src="extjs/js/languages.js"></script>
   <script type="text/javascript" src="extjs/lib/extjs/extjs-4.1.1/locale/ext-lang-ru.js"></script>

 
   
    <script type="text/javascript">
        Ext.Loader.setConfig({enabled: true});
        Ext.Loader.setPath({
            'Ext.ux': 'extjs/lib/extjs/extjs-4.1.1/examples/ux/',
        });
        Ext.require([
            'Ext.data.*',
            'Ext.tip.QuickTipManager',
            'Ext.form.*',
            'Ext.ux.data.PagingMemoryProxy',
            'Ext.grid.*',
            'Ext.direct.*',
            'Ext.window.MessageBox',
            'Ext.tip.*',
            'Ext.example.*',

        ]);
        
   var body = document.body;
   html = document.documentElement;
   var height = html.clientHeight;
   var width = html.clientWidth-210;
   //var height = Math.max( body.scrollHeight, body.offsetHeight,html.clientHeight, html.scrollHeight, html.offsetHeight );

   //var width = Math.max( body.scrollWidth, body.offsetWidth, html.clientWidth, html.scrollWidth, html.offsetWidth )-180;
    </script>
    


<?php
  include_once('config/index.php');
  $config = new Config();
  $modules = $config->get_modules();
  $groups  = $config->get_group();
  
  $m = $_GET['m'];
  if(isSet($m) && array_key_exists($m,$modules))
  {
   $url_controller = "app/".$m."/controller/";
   $_SESSION['url_controller'] = $url_controller;
   echo " <script src='app/".$m."/controller/index.php'></script> ";
   echo "<script type='text/javascript'>
            var path_app = 'app/".$m."/ext-view/'; \n
    </script>
    ";
   echo "<script type='text/javascript' src='app/".$m."/ext-view/app.js'></script>";
   
 }
  $roots = array();
   
  foreach($groups as $group){
     $child = array();
     //print_r($groups);
     foreach( $group->settings as $name => $opt){
      
        $child[] = "{ text: \"$opt->name\", leaf: true,id:'$opt->variable'}"; 
     }
     $roots[] = "{ text: \"$group->name\", expanded: true, children: [".implode(',',$child)."]}";
     
  }
echo "
<script type='text/javascript'>
   Ext.onReady(function(){
    var store = Ext.create('Ext.data.TreeStore', {
       root: {
           expanded: true,
           children: [
              ".implode(',',$roots)."
           ]
       }
   });

   Ext.create('Ext.tree.Panel', {
       title: 'Menu',
       width: 200,
       height: height,
       store: store,
       rootVisible: false,
       renderTo: 'menu',
       //collapsible: true,
       listeners:{
          itemclick: function( tree, record, item, index, e, eOpts ){
             console.log(record.get('id'));
             if(record.get('id') != undefined)
             window.location.href = 'index.php?m='+record.get('id');
             
          }
       }
   });
    
});
 </script>
";
?>

</head>
<body>
<div id="menu" style = "width:200px;float:left;"></div>
<div id="app" style = "margin-left:200px;margin-top:0px;"></div>
</body>
</html>
