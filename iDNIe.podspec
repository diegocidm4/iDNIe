Pod::Spec.new do |spec|

  spec.name         = "iDNIe"
  spec.version      = "3.01.22"
  spec.summary      = "Librería basada en Swift para el uso del DNIe"

  spec.description  = <<-DESC
Librería basada en Swift que permite las siguientes opciones:
- Uso del DNIe Español, implementando las siguientes funcionalidades:
    - Lectura de datos públicos del DNIe.
    - Firma de datos utilizando los certificados del DNIe. Firma con certificado de autorización para validación en sedes electrónicas y firma con certificado de firma para firmar documentos.
- Uso de cualquier documento electrónico de identidad que cumpla las normas ICAO (pasaportes o documentos nacionales de identidad), permitiendo la lectura de sus datos públicos.
                   DESC

  spec.homepage     = "https://github.com/diegocidm4/iDNIe"
  spec.license      = { :type => "Comercial", :file => "LICENSE" }
  spec.author       = { "Diego Cid Merino" => "diegocidm4@hotmail.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

 spec.dependency "BigInt.swift"
 spec.dependency "CryptoSwift", '1.6.0'
 spec.dependency "OpenSSL-Universal", '1.1.1900'
 
  spec.source        = { :git => "https://github.com/diegocidm4/iDNIe.git", :tag => "#{spec.version}" }
  spec.default_subspec     = 'Core'

  spec.subspec 'Core' do |core|
    core.preserve_paths      = 'Sources/iDNIe.xcframework'
    core.vendored_frameworks = 'Sources/iDNIe.xcframework'
  end

end
