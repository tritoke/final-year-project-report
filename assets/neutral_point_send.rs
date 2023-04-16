let message: ClientMessage<'_, K1> = ClientMessage::PublicKey(RistrettoPoint::identity());
let bytes_sent = send!(stream, message);
CLIENT_BYTES_SENT.fetch_add(bytes_sent, Ordering::SeqCst);
println!("[client] Sending Malicious PublicKey = RistrettoPoint::identity()");
println!(
    "[client] Sending message: PublicKey, sent {} bytes",
    bytes_sent
);
