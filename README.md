# iDNIe

Librería basada en Swift que permite las siguientes opciones:
- Uso del DNIe Español, implementando las siguientes funcionalidades:
    - Lectura de datos públicos del DNIe.
    - Firma de datos utilizando los certificados del DNIe. Firma con certificado de autorización para validación en sedes electrónicas y firma con certificado de firma para firmar documentos. 
- Uso de cualquier documento electrónico de identidad que cumpla las normas ICAO (pasaportes o documentos nacionales de identidad), permitiendo la lectura de sus datos públicos.

---

[Requisitos](#requisitos) | [Funcionalidades](#funcionalidades) | [Instalación](#instalacion) | [Autor](#autor) | [Licencia](#licencia)

## Requisitos
Esta librería está disponible para en ios 14 o posterior.
Esta librería permite la comunicación entre un dispositivo móvil y el DNIe Español u otros documentos electrónicos de identidad, mediante el uso de NFC. Es por ello que esta librería sólo puede ser usada en dispositivos móvil provistos de tecnología NFC, esta tecnología está disponible en todos los iphone a partir de iphone 7.

Esta librería tiene las siguientes dependencias:
- BigInt (https://github.com/Boilertalk/BigInt.swift.git)
- OpenSSL (https://github.com/krzyzanowskim/OpenSSL.git)
- CryptoSwift (https://github.com/krzyzanowskim/CryptoSwift.git)

## Funcionalidades
Esta ofrece las siguientes funcionalidades:
- Lectura de datos públicos del DNIe o cualquier documento electrónico de identidad:
Utilizando can para establecer canal seguro.
```Swift
        passportReader.readPassport(accessKey: can, paceKeyReference: PACEHandler.CAN_PACE_KEY_REFERENCE, tags: [], skipSecureElements: true, customDisplayMessage: { (displayMessage) in  return NFCUtils.customDisplayMessage(displayMessage: displayMessage)
        }, completed: { (passport, error) in
            if let passport = passport {            
                //passport contiene todos los datos del DNIe
            } else {
                //procesamos error
                print("Error: \(error?.localizedDescription)")
            }
        })
    }```


Utilizando mrz para establecer canal seguro.    
```Swift
        passportReader.readPassport(accessKey: mrzKey, paceKeyReference: PACEHandler.MRZ_PACE_KEY_REFERENCE, tags: [], skipSecureElements: true, customDisplayMessage: { (displayMessage) in
        return NFCUtils.customDisplayMessage(displayMessage: displayMessage)
        }, leeCertificadosPublicos: false, completed: { (passport, error) in
            if let passport = passport {            
                //passport contiene todos los datos del DNIe
            } else {
                //procesamos error
                print("Error: \(error?.localizedDescription)")
            }
        })
    }```    

- Firma de un texto en formato String con el certificado del DNIe que se le indique en certToUse:
```Swift
        passportReader.signTextDNIe(accessKey: can, pin: pinDNIe, datosFirma: textoFirmar, certToUse: .FIRMA, passport: passport, paceKeyReference: PACEHandler.CAN_PACE_KEY_REFERENCE, tags: [], skipSecureElements: true, customDisplayMessage: { (displayMessage) in
            return NFCUtils.customDisplayMessage(displayMessage: displayMessage)
        }, completed: { (pass, error) in
            if let passport = passport {            
                //passport.signedMessage contiene los datos firmados
            } else {
                //procesamos error
                print("Error: \(error?.localizedDescription)")
            }
        })
    }```

- Firma el hash del documento pasado como parámetro en document con el certificado del DNIe que se le indique en certToUse:
```Swift
        passportReader.signDocumentDNIe(accessKey: can, pin: pinDNIe, document: urlDocumento, certToUse: .FIRMA, passport: passport, paceKeyReference: PACEHandler.CAN_PACE_KEY_REFERENCE, tags: [], skipSecureElements: true, customDisplayMessage: { (displayMessage) in
            return NFCUtils.customDisplayMessage(displayMessage: displayMessage)
        }, completed: { (pass, error) in
            if let passport = passport {            
                //passport.signedMessage contiene los datos firmados
            } else {
                //procesamos error
                print("Error: \(error?.localizedDescription)")
            }
        })
    }```

- Firma el hash y el digest pasados como parámetros con el certificado del DNIe que se le indique en certToUse:
```Swift
        passportReader.signHashDNIe(accessKey: can, pin: pinDNIe, hash: hash, digest: digest, certToUse: DNIeCertificates.FIRMA, passport: passport, paceKeyReference: PACEHandler.CAN_PACE_KEY_REFERENCE, tags: [], skipSecureElements: true, customDisplayMessage: { (displayMessage) in
                return NFCUtils.customDisplayMessage(displayMessage: displayMessage)
            }, operacion: .FIRMA_DOCUMENTO, completed: { (passport, error) in
            if let passport = passport {            
                //passport.signedMessage contiene los datos firmados
            } else {
                //procesamos error
                print("Error: \(error?.localizedDescription)")
            }
        })
    }```

- Establece los canales de conexión necesarios para realizar operaciones de firma con el DNIe dejándolos abiertos a la espera de la petición de firma:
```Swift
            passportReader.authenticationDNIeOpenSession(accessKey: can, pin: pinDNIe, passport: passport, paceKeyReference: PACEHandler.CAN_PACE_KEY_REFERENCE, tags: [], skipSecureElements: true, customDisplayMessage: { (displayMessage) in
                return NFCUtils.customDisplayMessage(displayMessage: displayMessage)
            }, completed: { (pass, error) in
            if let passport = passport {            
                //passport contiene todos los datos del DNIe
            } else {
                //procesamos error
                print("Error: \(error?.localizedDescription)")
            }
        })
    }```

- Firma el hash y el digest pasados como parámetros con el certificado de autenticación del DNIe:
```Swift
        passportReader.signChallengeDNIe(hash: hash, digest: digest, signPadding: .PKCS, passport: passport, paceKeyReference: PACEHandler.CAN_PACE_KEY_REFERENCE, customDisplayMessage: { (displayMessage) in
                return NFCUtils.customDisplayMessage(displayMessage: displayMessage)
            }, completed: { (passport, error) in
            if let passport = passport {            
                //passport.signedMessage contiene los datos firmados
            } else {
                //procesamos error
                print("Error: \(error?.localizedDescription)")
            }
        })
    }```


## Instalación

### Swift Package Manager

iDNIe.swift es compatible con Swift Package Manager v4 (Swift 4 and above). Simplemente añádela a las dependencias en tu `Package.swift`.

```Swift
dependencies: [
    .package(url: "https://github.com/diegocidm4/iDNIe.git", from: "1.0.0")
]
```

Después de esto, podrás importarla en tus ficheros `.swift`.

```Swift
import iDNIe
```

## Autor

iDNIe ha sido creada y mantenida por [Diego Cid]

Puede seguirme en Twitter en [@diegocidm4](http://twitter.com/diegocidm4).

## Licencia
La librería se distribuye con una licencia anual asociada a un app bundle.
