pub struct AuCPaceServer<D, CSPRNG, const K1: usize>
where
    D: Digest<OutputSize = U64> + Default,
    CSPRNG: CryptoRng + RngCore,
{
    rng: CSPRNG,
    secret: u64,
    d: PhantomData<D>,
}
