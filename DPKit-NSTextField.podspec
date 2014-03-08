Pod::Spec.new do |s|
  s.name         = "DPKit-NSTextField"
  s.version      = "0.0.2"
  s.summary      = "DPKit-NSTextField"
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }


  s.source       = { :git => "https://github.com/dpostigo/DPKit-NSTextField.git", :tag => s.version.to_s }
  s.platform     = :osx, '10.8'


  s.dependency     'DPKit-Styles'
  s.dependency     'DPKit-NSCell'
  s.frameworks   = 'Foundation', 'QuartzCore'
  s.requires_arc = true

  s.source_files = 'DPKit-NSTextField/*.{h,m}'



  
end
