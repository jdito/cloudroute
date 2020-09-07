resource "aws_key_pair" "default" {
  key_name   = "default-key"
  public_key = var.pubkey
}
