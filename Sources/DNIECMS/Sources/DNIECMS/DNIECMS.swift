import Foundation
import Security
@_spi(CMS) import X509
import SwiftASN1

/// Base64 encoded data with CMS(pkcs7) DER
/// - Parameters:
///   - data: Data to sign
///   - publicCertificateBase64: Public Certificate. Base64 Encoded.
/// - Returns: CMS PKCS7 data
public func pkcs7SignCMS(data dataToSign: Data, privateKey: SecKey, publicCertificateBase64: String) throws -> Data {
    let publicCertificateData = Data(base64Encoded: publicCertificateBase64)!
    let certificate = try X509.Certificate(derEncoded: Array(publicCertificateData))
    let cms = try Data(CMS.sign(dataToSign, certificate: certificate, privateKey: privateKey))
    return cms.base64EncodedData()
}

extension CMS {
    static func sign<Bytes: DataProtocol>(
        _ bytes: Bytes,
        additionalIntermediateCertificates: [Certificate] = [],
        certificate: Certificate,
        privateKey: SecKey
    ) throws -> [UInt8] {
        /// This value represents an RSA signature with PKCS1v1.5 padding and SHA256 as the hash function.
        let signatureAlgorithm: Certificate.SignatureAlgorithm = .sha256WithRSAEncryption

        //  let signature = try privateKey.sign(bytes: bytes, signatureAlgorithm: signatureAlgorithm)
        let signedData = SecKeyCreateSignature(privateKey, .rsaSignatureMessagePKCS1v15SHA256, Data(bytes) as CFData, nil)! as Data
        let signatureBytes = ASN1BitString(bytes: Array(signedData)[...])
        let signature = try Certificate.Signature(signatureAlgorithm: signatureAlgorithm, signatureBytes: signatureBytes)

        return try sign(
            signatureBytes: ASN1OctetString(signature),
            signatureAlgorithm: signatureAlgorithm,
            additionalIntermediateCertificates: additionalIntermediateCertificates,
            certificate: certificate
        )
    }
}
