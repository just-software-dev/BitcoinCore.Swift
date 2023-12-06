import Foundation
import HdWalletKit

extension HDWallet: IHDWallet {
    public enum HDWalletError: Error {
        case publicKeysDerivationFailed
    }

    func publicKey(account: Int, index: Int, external: Bool) throws -> PublicKey {
        try PublicKey(withAccount: account, index: index, external: external, hdPublicKeyData: publicKey(account: account, index: index, chain: external ? .external : .internal).raw)
    }

    func publicKeys(account: Int, indices: Range<UInt32>, external: Bool) throws -> [PublicKey] {
        let hdPublicKeys: [HDPublicKey] = try publicKeys(account: account, indices: indices, chain: external ? .external : .internal)

        guard hdPublicKeys.count == indices.count else {
            throw HDWalletError.publicKeysDerivationFailed
        }

        return try indices.map { index in
            let key = hdPublicKeys[Int(index - indices.lowerBound)]
            return try PublicKey(withAccount: account, index: Int(index), external: external, hdPublicKeyData: key.raw)
        }
    }
}

extension HDWallet: IPrivateHDWallet {
    func privateKeyData(account: Int, index: Int, external: Bool) throws -> Data {
        try privateKey(account: account, index: index, chain: external ? .external : .internal).raw
    }
}
