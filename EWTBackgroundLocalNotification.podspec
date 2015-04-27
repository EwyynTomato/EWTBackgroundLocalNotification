Pod::Spec.new do |s|
	s.name		    	= 'EWTBackgroundLocalNotification'
	s.version	    	= '0.1.0'
	s.summary		    = 'iOS: Show queued local notification as soon as app enters background.'
	s.homepage	  	= 'https://github.com/EwyynTomato/EWTBackgroundLocalNotification'
	s.author	    	= { 'EwyynTomato' => 'elwyyntomato+github@gmail.com' }
	s.license 	  	= 'MIT'
	s.platform		  = :ios, '6.0'
	s.requires_arc	= true
  s.screenshots   = [ 'https://raw.githubusercontent.com/EwyynTomato/EWTBackgroundLocalNotification/master/screenshots/preview.gif' ]
	s.source	    	= { :git => 'https://github.com/EwyynTomato/EWTBackgroundLocalNotification', :tag => s.version.to_s }
	s.source_files	= 'EWTBackgroundLocalNotification/*.{h,m}'
end
