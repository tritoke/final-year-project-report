/// SRP server state
pub struct SrpServer<'a, D: Digest> {
    params: &'a SrpGroup,
    d: PhantomData<D>,
}
