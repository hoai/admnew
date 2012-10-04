
<?php
class Config{
   private $config_dir  = 'config/map/';
   private $group_dir   = 'config/group/';
   function get_modules()
	{
		$config_dir  = $this->config_dir;
		$modules     = array();
		$handler     = opendir($config_dir);
		while ($file = readdir($handler))
		{
         if(is_readable($config_dir.$file) && $xml = simplexml_load_file($config_dir.$file))
				{
					$module = null;
					$module->name = trim((string)$xml->name);
					$module->settings = array();
	
					foreach($xml->settings as $setting)
					{
						$module->settings[(string)$setting->variable]->name = (string)$setting->name;
						$module->settings[(string)$setting->variable]->variable = (string)$setting->variable;
					}
					$modules[$module->name] = $module;
				}
		}
    	closedir($handler);
    	return $modules;

	}
   function get_group()
	{
		$config_dir  = $this->group_dir;
		$modules     = array();
		$handler     = opendir($config_dir);
		while ($file = readdir($handler))
		{
         if(is_readable($config_dir.$file) && $xml = simplexml_load_file($config_dir.$file))
				{
					
               //print_r($xml);
               
               $module = null;
					$module->name = trim((string)$xml->name);	
					foreach($xml->module as $mod)
					{
						$module->settings[(string)$mod->variable]->name = (string)$mod->name;
						$module->settings[(string)$mod->variable]->variable = (string)$mod->variable;
					}
					$modules[$module->name] = $module;
				}
		}
      
    	closedir($handler);
    	return $modules;

	}
   
}
//$h = new Config();
//$t = $h->get_group();

//print_r($t);
?>
