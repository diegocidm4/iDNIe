import XCTest
@testable import DNIECMS

final class DNIECMSTests: XCTestCase {
    
//    func testExample() throws {
//        let signedData = Data([0x5D ,0xC5 ,0xF7 ,0x17 ,0x8C ,0x31 ,0x06 ,0x73 ,0xBC ,0x43 ,0xB0 ,0x0C ,0x02 ,0x5B ,0x5F ,0x19 ,0x6A ,0x09 ,0xF5 ,0x6D ,0x27 ,0x9E ,0xD2 ,0x7B ,0x2C ,0x95 ,0xEA ,0xDF ,0x27 ,0xE7 ,0x69 ,0x11 ,0xB5 ,0xB7 ,0x24 ,0x8C ,0x3D ,0x60 ,0x0E ,0xED ,0x77 ,0x3E ,0xBD ,0x18 ,0x30 ,0x72 ,0xCE ,0x9A ,0x88 ,0x4D ,0xE5 ,0x45 ,0xAF ,0xCE ,0x78 ,0x27 ,0xE2 ,0xD4 ,0x22 ,0xE0 ,0xA2 ,0x8D ,0x97 ,0xBA ,0x06 ,0x81 ,0x27 ,0xF5 ,0x64 ,0x32 ,0xAE ,0xA2 ,0xAC ,0x6B ,0x94 ,0x3B ,0xFE ,0x44 ,0x85 ,0x70 ,0x05 ,0x56 ,0x35 ,0x55 ,0x34 ,0x42 ,0xB3 ,0xEA ,0x85 ,0x9E ,0x18 ,0x65 ,0xA4 ,0xE0 ,0x2D ,0xF7 ,0xA4 ,0x45 ,0x25 ,0x07 ,0xDE ,0x65 ,0xF8 ,0x6A ,0x5E ,0x5D ,0x61 ,0x4A ,0xD6 ,0xD5 ,0x5B ,0x5B ,0x9C ,0x5D ,0x2B ,0x85 ,0x43 ,0xE2 ,0xB2 ,0x41 ,0x66 ,0xA2 ,0xBD ,0x2F ,0x63 ,0xF8 ,0xF6 ,0x1D ,0x65 ,0xD6 ,0x21 ,0xF6 ,0x72 ,0x82 ,0x74 ,0xC2 ,0xEB ,0xB5 ,0xDE ,0xF2 ,0x42 ,0x31 ,0xD0 ,0x6F ,0x11 ,0x57 ,0x87 ,0x2D ,0x8F ,0x5B ,0xAC ,0x45 ,0x07 ,0x7E ,0x9C ,0x73 ,0x00 ,0x5C ,0xDC ,0x6D ,0xCA ,0x27 ,0xFF ,0x49 ,0xE7 ,0xED ,0x21 ,0xF6 ,0x6D ,0x3F ,0x67 ,0x0B ,0x76 ,0xA5 ,0x51 ,0x3A ,0x50 ,0x94 ,0x1D ,0x9A ,0x0C ,0x8A ,0x24 ,0xA2 ,0x24 ,0x5F ,0xCE ,0x25 ,0x6A ,0xFB ,0x5C ,0xC0 ,0x2D ,0x9D ,0xEB ,0xF1 ,0x66 ,0x6A ,0xD5 ,0x65 ,0xE1 ,0xB8 ,0xA2 ,0x8B ,0xC4 ,0xE1 ,0x7D ,0x1C ,0x00 ,0x4A ,0xBF ,0x6F ,0x47 ,0x81 ,0x4C ,0x1D ,0x1D ,0x0F ,0xF9 ,0x28 ,0xC1 ,0xDE ,0x2A ,0xD6 ,0x5C ,0xD4 ,0x59 ,0x4F ,0x5F ,0x4C ,0x29 ,0x5A ,0x23 ,0xD0 ,0x99 ,0x76 ,0xE4 ,0xCE ,0x88 ,0x24 ,0x01 ,0x82 ,0x2C ,0x49 ,0x7C ,0x8F ,0x9A ,0xF9 ,0x7B ,0xAC ,0xAA ,0x45 ,0xCF ,0x61 ,0xCA ,0xDB])
//        let publicCertificateBase64 = "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"
//        let result = pkcs7SignCMS(signedData: signedData, publicCertificateBase64: publicCertificateBase64)
//        XCTAssertNotNil(result)
//        //print(String(decoding: result!, as: UTF8.self))
//
//        // try! result?.write(to: URL(fileURLWithPath: "/Users/marcinkrzyzanowski/Devel/DNIECms/data/cms.base64"))
//
//        // $ cat cms.base64 | base64 -D | openssl asn1parse -inform DER
//        // 0:d=0  hl=4 l= 715 cons: SEQUENCE
//        // 4:d=1  hl=2 l=   9 prim: OBJECT            :pkcs7-envelopedData
//        // 15:d=1  hl=4 l= 700 cons: cont [ 0 ]
//        // 19:d=2  hl=4 l= 696 cons: SEQUENCE
//        // 23:d=3  hl=2 l=   1 prim: INTEGER           :00
//        // 26:d=3  hl=4 l= 384 cons: SET
//        // 30:d=4  hl=4 l= 380 cons: SEQUENCE
//        // 34:d=5  hl=2 l=   1 prim: INTEGER           :00
//        // 37:d=5  hl=2 l= 100 cons: SEQUENCE
//        // 39:d=6  hl=2 l=  92 cons: SEQUENCE
//        // 41:d=7  hl=2 l=  11 cons: SET
//        // 43:d=8  hl=2 l=   9 cons: SEQUENCE
//        // 45:d=9  hl=2 l=   3 prim: OBJECT            :countryName
//        // 50:d=9  hl=2 l=   2 prim: PRINTABLESTRING   :ES
//        // 54:d=7  hl=2 l=  40 cons: SET
//        // 56:d=8  hl=2 l=  38 cons: SEQUENCE
//        // 58:d=9  hl=2 l=   3 prim: OBJECT            :organizationName
//        // 63:d=9  hl=2 l=  31 prim: UTF8STRING        :DIRECCION GENERAL DE LA POLICIA
//        // 96:d=7  hl=2 l=  13 cons: SET
//        // 98:d=8  hl=2 l=  11 cons: SEQUENCE
//        // 100:d=9  hl=2 l=   3 prim: OBJECT            :organizationalUnitName
//        // 105:d=9  hl=2 l=   4 prim: UTF8STRING        :DNIE
//        // 111:d=7  hl=2 l=  20 cons: SET
//        // 113:d=8  hl=2 l=  18 cons: SEQUENCE
//        // 115:d=9  hl=2 l=   3 prim: OBJECT            :commonName
//        // 120:d=9  hl=2 l=  11 prim: UTF8STRING        :AC DNIE 005
//        // 133:d=6  hl=2 l=   4 prim: INTEGER           :558C774C
//        // 139:d=5  hl=2 l=  13 cons: SEQUENCE
//        // 141:d=6  hl=2 l=   9 prim: OBJECT            :rsaEncryption
//        // 152:d=6  hl=2 l=   0 prim: NULL
//        // 154:d=5  hl=4 l= 256 prim: OCTET STRING      [HEX DUMP]:414CC4353C854374D49AA54190C110E82B1CBBED1EC916F8F57492EF3E8D8685EC8D83189B19BB0EDBAF8F619FE644A97B99BB05F3C7BF6CE2F8514B1850D691355AD085CAB73352F93DA971A6D4411D7CDF98EEB68DD73218D299F497D713269F7566C9D5479EFDF93D85DB355ED5143B8CFC1D5F219E77ED2D9D5A8F68C0BF913A767D1E1A74C1BE4532A123FC1FF85D92B4AB0AB7ACBB38D79C94D9149485BD4296B7B05093D2EBD05D0E56FDF1C40148D0F27C65A6C649C9D50157B1580089C749B61CBB77409E72CBACA3EFB40F3AB4CC93D2E747BE7284780A8E0206640F1080EEDAD717FF0560206F7DFDAF596D9720ACC1A6B393C384EDCA8F238C59
//        // 414:d=3  hl=4 l= 301 cons: SEQUENCE
//        // 418:d=4  hl=2 l=   9 prim: OBJECT            :pkcs7-data
//        // 429:d=4  hl=2 l=  20 cons: SEQUENCE
//        // 431:d=5  hl=2 l=   8 prim: OBJECT            :des-ede3-cbc
//        // 441:d=5  hl=2 l=   8 prim: OCTET STRING      [HEX DUMP]:CF42B6B1BA908653
//        // 451:d=4  hl=4 l= 264 prim: cont [ 0 ]
//
//        // $ cat cms.base64 | base64 -D | openssl cms -inform DER -cmsout
//
//        // MIME-Version: 1.0
//        // Content-Disposition: attachment; filename="smime.p7m"
//        // Content-Type: application/pkcs7-mime; smime-type=enveloped-data; name="smime.p7m"
//        // Content-Transfer-Encoding: base64
//        //
//        // MIICywYJKoZIhvcNAQcDoIICvDCCArgCAQAxggGAMIIBfAIBADBkMFwxCzAJBgNV
//        // BAYTAkVTMSgwJgYDVQQKDB9ESVJFQ0NJT04gR0VORVJBTCBERSBMQSBQT0xJQ0lB
//        // MQ0wCwYDVQQLDARETklFMRQwEgYDVQQDDAtBQyBETklFIDAwNQIEVYx3TDANBgkq
//        // hkiG9w0BAQEFAASCAQBBTMQ1PIVDdNSapUGQwRDoKxy77R7JFvj1dJLvPo2GheyN
//        // gxibGbsO26+PYZ/mRKl7mbsF88e/bOL4UUsYUNaRNVrQhcq3M1L5PalxptRBHXzf
//        // mO62jdcyGNKZ9JfXEyafdWbJ1Uee/fk9hds1XtUUO4z8HV8hnnftLZ1aj2jAv5E6
//        // dn0eGnTBvkUyoSP8H/hdkrSrCresuzjXnJTZFJSFvUKWt7BQk9Lr0F0OVv3xxAFI
//        // 0PJ8ZabGScnVAVexWACJx0m2HLt3QJ5yy6yj77QPOrTMk9LnR75yhHgKjgIGZA8Q
//        // gO7a1xf/BWAgb339r1ltlyCswaazk8OE7cqPI4xZMIIBLQYJKoZIhvcNAQcBMBQG
//        // CCqGSIb3DQMHBAjPQraxupCGU4CCAQhQON+xz0NQbc8PfITAfnYEozeZptBkjDf8
//        // RlvO/wzAGADj5S0FWnzYtTcHqZHnyosjubPWuPSc4ifWAo2TRsjQnQAAfr54XSry
//        // BBwlwi/xZF7OzYwGR5gi3XBY6PIwfckWqn4xK68RtH4+0jZcRPF688SEriqMP7gN
//        // 4xKyn+EdxETapH5EbJckgmANom81JKDjxxxAPB955PALn//VPxsfl7/ItNg2xMPK
//        // 5wds/LSxRtydz2k1bWrHd+6JOyvEwAfdlM20G97O5Qi8PCb6IMYkYUoqRQ928b4L
//        // RRX4TC5xSMsAgRiG+grUT3SazeNH/wJfGzDcW1XBrZjf5Q4nT52CHGSROVWUQO4=
//    }

    func testExample2() {
        let publicCertificateBase64 = "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"

        let privateAttributes = [String(kSecAttrIsPermanent): true,
                                 String(kSecAttrAccessible): kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly] as [String : Any]
        let publicAttributes = [String(kSecAttrIsPermanent): true,
                                String(kSecAttrAccessible): kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly] as [String : Any]

        let pairAttributes = [String(kSecAttrKeyType): kSecAttrKeyTypeRSA,
                              String(kSecAttrKeySizeInBits): 2048,
                              String(kSecPublicKeyAttrs): publicAttributes,
                              String(kSecPrivateKeyAttrs): privateAttributes] as [String : Any]
        var pubKey, privKey: SecKey?
        let status = SecKeyGeneratePair(pairAttributes as CFDictionary, &pubKey, &privKey)

        let result = try? pkcs7SignCMS(data: "data to sign".data(using: .utf8)!, privateKey: privKey!, publicCertificateBase64: publicCertificateBase64)
        XCTAssertNotNil(result)
        // try? result?.write(to: URL(fileURLWithPath: "/Users/marcinkrzyzanowski/Devel/DNIECms/data/cms.base64"))

        // 0:d=0  hl=4 l=2264 cons: SEQUENCE
        // 4:d=1  hl=2 l=   9 prim: OBJECT            :pkcs7-signedData
        // 15:d=1  hl=4 l=2249 cons: cont [ 0 ]
        // 19:d=2  hl=4 l=2245 cons: SEQUENCE
        // 23:d=3  hl=2 l=   1 prim: INTEGER           :01
        // 26:d=3  hl=2 l=  13 cons: SET
        // 28:d=4  hl=2 l=  11 cons: SEQUENCE
        // 30:d=5  hl=2 l=   9 prim: OBJECT            :sha256
        // 41:d=3  hl=2 l=  11 cons: SEQUENCE
        // 43:d=4  hl=2 l=   9 prim: OBJECT            :pkcs7-data
        // 54:d=3  hl=4 l=1809 cons: cont [ 0 ]
        // 58:d=4  hl=4 l=1805 cons: SEQUENCE
        // 62:d=5  hl=4 l=1269 cons: SEQUENCE
        // 66:d=6  hl=2 l=   3 cons: cont [ 0 ]
        // 68:d=7  hl=2 l=   1 prim: INTEGER           :02
        // 71:d=6  hl=2 l=   4 prim: INTEGER           :558C774C
        // 77:d=6  hl=2 l=  13 cons: SEQUENCE
        // 79:d=7  hl=2 l=   9 prim: OBJECT            :sha256WithRSAEncryption
        // 90:d=7  hl=2 l=   0 prim: NULL
        // 92:d=6  hl=2 l=  92 cons: SEQUENCE
        // 94:d=7  hl=2 l=  11 cons: SET
        // 96:d=8  hl=2 l=   9 cons: SEQUENCE
        // 98:d=9  hl=2 l=   3 prim: OBJECT            :countryName
        // 103:d=9  hl=2 l=   2 prim: PRINTABLESTRING   :ES
        // 107:d=7  hl=2 l=  40 cons: SET
        // 109:d=8  hl=2 l=  38 cons: SEQUENCE
        // 111:d=9  hl=2 l=   3 prim: OBJECT            :organizationName
        // 116:d=9  hl=2 l=  31 prim: UTF8STRING        :DIRECCION GENERAL DE LA POLICIA
        // 149:d=7  hl=2 l=  13 cons: SET
        // 151:d=8  hl=2 l=  11 cons: SEQUENCE
        // 153:d=9  hl=2 l=   3 prim: OBJECT            :organizationalUnitName
        // 158:d=9  hl=2 l=   4 prim: UTF8STRING        :DNIE
        // 164:d=7  hl=2 l=  20 cons: SET
        // 166:d=8  hl=2 l=  18 cons: SEQUENCE
        // 168:d=9  hl=2 l=   3 prim: OBJECT            :commonName
        // 173:d=9  hl=2 l=  11 prim: UTF8STRING        :AC DNIE 005
        // 186:d=6  hl=2 l=  30 cons: SEQUENCE
        // 188:d=7  hl=2 l=  13 prim: UTCTIME           :221017113455Z
        // 203:d=7  hl=2 l=  13 prim: UTCTIME           :241017113453Z
        // 218:d=6  hl=2 l= 108 cons: SEQUENCE
        // 220:d=7  hl=2 l=  11 cons: SET
        // 222:d=8  hl=2 l=   9 cons: SEQUENCE
        // 224:d=9  hl=2 l=   3 prim: OBJECT            :countryName
        // 229:d=9  hl=2 l=   2 prim: PRINTABLESTRING   :ES
        // 233:d=7  hl=2 l=  18 cons: SET
        // 235:d=8  hl=2 l=  16 cons: SEQUENCE
        // 237:d=9  hl=2 l=   3 prim: OBJECT            :serialNumber
        // 242:d=9  hl=2 l=   9 prim: PRINTABLESTRING   :44470662R
        // 253:d=7  hl=2 l=  12 cons: SET
        // 255:d=8  hl=2 l=  10 cons: SEQUENCE
        // 257:d=9  hl=2 l=   3 prim: OBJECT            :surname
        // 262:d=9  hl=2 l=   3 prim: UTF8STRING        :CID
        // 267:d=7  hl=2 l=  14 cons: SET
        // 269:d=8  hl=2 l=  12 cons: SEQUENCE
        // 271:d=9  hl=2 l=   3 prim: OBJECT            :givenName
        // 276:d=9  hl=2 l=   5 prim: UTF8STRING        :DIEGO
        // 283:d=7  hl=2 l=  43 cons: SET
        // 285:d=8  hl=2 l=  41 cons: SEQUENCE
        // 287:d=9  hl=2 l=   3 prim: OBJECT            :commonName
        // 292:d=9  hl=2 l=  34 prim: UTF8STRING        :CID MERINO, DIEGO (AUTENTICACIÓN)
        // 328:d=6  hl=4 l= 290 cons: SEQUENCE
        // 332:d=7  hl=2 l=  13 cons: SEQUENCE
        // 334:d=8  hl=2 l=   9 prim: OBJECT            :rsaEncryption
        // 345:d=8  hl=2 l=   0 prim: NULL
        // 347:d=7  hl=4 l= 271 prim: BIT STRING
        // 622:d=6  hl=4 l= 709 cons: cont [ 3 ]
        // 626:d=7  hl=4 l= 705 cons: SEQUENCE
        // 630:d=8  hl=2 l=  14 cons: SEQUENCE
        // 632:d=9  hl=2 l=   3 prim: OBJECT            :X509v3 Key Usage
        // 637:d=9  hl=2 l=   1 prim: BOOLEAN           :255
        // 640:d=9  hl=2 l=   4 prim: OCTET STRING      [HEX DUMP]:03020780
        // 646:d=8  hl=2 l=  40 cons: SEQUENCE
        // 648:d=9  hl=2 l=   3 prim: OBJECT            :X509v3 Subject Directory Attributes
        // 653:d=9  hl=2 l=  33 prim: OCTET STRING      [HEX DUMP]:301F301D06082B060105050709013111180F31393830303832303132303030305A
        // 688:d=8  hl=2 l=  66 cons: SEQUENCE
        // 690:d=9  hl=2 l=   8 prim: OBJECT            :2.16.724.1.2.2.4.1
        // 700:d=9  hl=2 l=  54 prim: OCTET STRING      [HEX DUMP]:30343032020102300B06096086480165030402010420298CDA844F7BAD9C440EE3AA7A8926ABAC1EEDCE6EE301838F2D8A2C93B3E0C7
        // 756:d=8  hl=3 l= 240 cons: SEQUENCE
        // 759:d=9  hl=2 l=   8 prim: OBJECT            :Biometric Info
        // 769:d=9  hl=3 l= 227 prim: OCTET STRING      [HEX DUMP]:3081E03032020101300B06096086480165030402010420FA7E043BA81A98F43F588BC6E39F26CE10040C2BE7BB1583058F924C84CFCDE93032020100300B0609608648016503040201042095DA4C5960C8343E8F9D46A3FEEF619C3ABEB2183A4F38AED0EE5AC15674892A303A0609608554010202040201300B06096086480165030402010420080D92AFFC8D7532C4715CCEBC0A4DB1756F0EA6435FC1F1F0D02A9FF4EFC2BF303A0609608554010202040206300B060960864801650304020104208C3D250000228D9B258EADF262E80224E01E6830B0E4419AA0AF78C68FE74A2B
        // 999:d=8  hl=2 l=  12 cons: SEQUENCE
        // 1001:d=9  hl=2 l=   3 prim: OBJECT            :X509v3 Basic Constraints
        // 1006:d=9  hl=2 l=   1 prim: BOOLEAN           :255
        // 1009:d=9  hl=2 l=   2 prim: OCTET STRING      [HEX DUMP]:3000
        // 1013:d=8  hl=2 l= 103 cons: SEQUENCE
        // 1015:d=9  hl=2 l=   8 prim: OBJECT            :Authority Information Access
        // 1025:d=9  hl=2 l=  91 prim: OCTET STRING      [HEX DUMP]:3059301F06082B060105050730018613687474703A2F2F6F6373702E646E69652E6573303606082B06010505073002862A687474703A2F2F706B692E706F6C696369612E65732F646E69652F63657274732F41433030352E637274
        // 1118:d=8  hl=3 l= 150 cons: SEQUENCE
        // 1121:d=9  hl=2 l=   3 prim: OBJECT            :X509v3 Certificate Policies
        // 1126:d=9  hl=3 l= 142 prim: OCTET STRING      [HEX DUMP]:30818B30818806086085540102020204307C303806082B06010505070201162C687474703A2F2F706B692E706F6C696369612E65732F646E69652F7075626C69636163696F6E65732F647063304006082B0601050507020230340C3244495245434349C3934E2047454E4552414C204445204C4120504F4C4943C38D412C2056415445532D533238313630313548
        // 1271:d=8  hl=2 l=  31 cons: SEQUENCE
        // 1273:d=9  hl=2 l=   3 prim: OBJECT            :X509v3 Authority Key Identifier
        // 1278:d=9  hl=2 l=  24 prim: OCTET STRING      [HEX DUMP]:3016801481E34D760C6FDED72C40A1AA5C79D5FD40B06821
        // 1304:d=8  hl=2 l=  29 cons: SEQUENCE
        // 1306:d=9  hl=2 l=   3 prim: OBJECT            :X509v3 Subject Key Identifier
        // 1311:d=9  hl=2 l=  22 prim: OCTET STRING      [HEX DUMP]:04145ED7FE6199F2079B2DDB637692BA2CA1A0AFFFBF
        // 1335:d=5  hl=2 l=  13 cons: SEQUENCE
        // 1337:d=6  hl=2 l=   9 prim: OBJECT            :sha256WithRSAEncryption
        // 1348:d=6  hl=2 l=   0 prim: NULL
        // 1350:d=5  hl=4 l= 513 prim: BIT STRING
        // 1867:d=3  hl=4 l= 397 cons: SET
        // 1871:d=4  hl=4 l= 393 cons: SEQUENCE
        // 1875:d=5  hl=2 l=   1 prim: INTEGER           :01
        // 1878:d=5  hl=2 l= 100 cons: SEQUENCE
        // 1880:d=6  hl=2 l=  92 cons: SEQUENCE
        // 1882:d=7  hl=2 l=  11 cons: SET
        // 1884:d=8  hl=2 l=   9 cons: SEQUENCE
        // 1886:d=9  hl=2 l=   3 prim: OBJECT            :countryName
        // 1891:d=9  hl=2 l=   2 prim: PRINTABLESTRING   :ES
        // 1895:d=7  hl=2 l=  40 cons: SET
        // 1897:d=8  hl=2 l=  38 cons: SEQUENCE
        // 1899:d=9  hl=2 l=   3 prim: OBJECT            :organizationName
        // 1904:d=9  hl=2 l=  31 prim: UTF8STRING        :DIRECCION GENERAL DE LA POLICIA
        // 1937:d=7  hl=2 l=  13 cons: SET
        // 1939:d=8  hl=2 l=  11 cons: SEQUENCE
        // 1941:d=9  hl=2 l=   3 prim: OBJECT            :organizationalUnitName
        // 1946:d=9  hl=2 l=   4 prim: UTF8STRING        :DNIE
        // 1952:d=7  hl=2 l=  20 cons: SET
        // 1954:d=8  hl=2 l=  18 cons: SEQUENCE
        // 1956:d=9  hl=2 l=   3 prim: OBJECT            :commonName
        // 1961:d=9  hl=2 l=  11 prim: UTF8STRING        :AC DNIE 005
        // 1974:d=6  hl=2 l=   4 prim: INTEGER           :558C774C
        // 1980:d=5  hl=2 l=  11 cons: SEQUENCE
        // 1982:d=6  hl=2 l=   9 prim: OBJECT            :sha256
        // 1993:d=5  hl=2 l=  13 cons: SEQUENCE
        // 1995:d=6  hl=2 l=   9 prim: OBJECT            :sha256WithRSAEncryption
        // 2006:d=6  hl=2 l=   0 prim: NULL
        // 2008:d=5  hl=4 l= 256 prim: OCTET STRING      [HEX DUMP]:627AC78C7B8F19E5C2BA4D66DFB85657099CA1DA176192C19BF9B86AD6E940C69112BC96BCFA1D74E2103C8AC46AD660D3C90773ABCA9FD4DA13C665142FAE80E5662C1E255E8AB7C1AE7F6D79C4F221C69400B66D0911B547881EC0C775CE305D956908355404EF2912F9E3F795583E5B9CC7252A6206C5AFC77139064EE37A41FD98990A080729795602D42F90BF3C22316A1A8368F41AEC2DFA86EAEA14A7B728B866417D1C4D3E83B3777C378CA5BED7E54DA7A8714B03DF346481D76D4CA7B904424BCA7748B8405C669C7467B1C29AB8275FBAC78353D66AC52A1CCBE3A7029F5B09158CCAF667CF1FFF8C553D82B5E3E07594D8F3D341733FA7D74019

    }
}
