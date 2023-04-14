/// Password Verifier database which can store the info for one user
#[derive(Debug, Default)]
struct SingleUserDatabase {
    user: Option<Vec<u8>>,
    data: Option<(RistrettoPoint, SaltString, ParamsString)>,
}

impl Database for SingleUserDatabase {
    type PasswordVerifier = RistrettoPoint;

    fn lookup_verifier(
        &self,
        username: &[u8],
    ) -> Option<(Self::PasswordVerifier, SaltString, ParamsString)> {
        match &self.user {
            Some(stored_username) if stored_username == username => self.data.clone(),
            _ => None,
        }
    }

    fn store_verifier(
        &mut self,
        username: &[u8],
        salt: SaltString,
        _uad: Option<&[u8]>,
        verifier: Self::PasswordVerifier,
        params: ParamsString,
    ) {
        self.user = Some(username.to_vec());
        self.data = Some((verifier, salt, params));
    }
}
