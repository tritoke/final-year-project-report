pub trait Database {
    type PasswordVerifier;

    fn lookup_verifier(
        &self,
        username: &[u8]
    ) -> Option<(Self::PasswordVerifier, SaltString, ParamsString)>;

    fn store_verifier(
        &mut self,
        username: &[u8],
        salt: SaltString,
        uad: Option<&[u8]>,
        verifier: Self::PasswordVerifier,
        params: ParamsString
    );
}
