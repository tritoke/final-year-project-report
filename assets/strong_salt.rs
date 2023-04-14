// this is a tad funky, in the paper they write (1/(r * cj^2))*cj
// I have interpreted this as the multiplicative inverse of (r * cj^2)
// then multiplied by cj again.
let exponent = (self.blinding_value * cofactor * cofactor).invert() * cofactor;
let salt = (blinded_salt * exponent).compress().to_bytes();
let salt_string = SaltString::encode_b64(&salt).map_err(Error::PasswordHashing)?;
