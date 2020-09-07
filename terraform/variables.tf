variable "region" {
  default = "us-east-2"
}

# Amazon Linux
variable "amis" {
  type = map(string)
  default = {
    "us-east-2" = "ami-0603cbe34fd08cb81"
  }
}

# Public DNS Zone ID
# Z3OIIUEEGFSDNQ is aws.ditommasso.com, 
# you should probably use something else
variable "zone_id" {
  default = "Z3OIIUEEGFSDNQ"
}

# SSH Keypair
# Again, set your own
variable "pubkey" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4TKUYxuDr5xZ72xL4sdsvqST4NqKWUQ1NCrqr4rK6ATmyQnt1KmDuRVeYgbbk2vy9IZqBTUfAgj+CEy0S15bqD3lwn6czfz5BVbFRuopqTZwaC+osTwo9lSw3bqAPPqUlOzynseOF0GuuOUSD+JR4CQGZycIWFJ8RqtFfZ63b0Lx2KWWkcTFi33NmZGVWiUAuVYCcPVncmtgQx9WLyoIsEqC8+OENNYw6fa3pdOHp3hnqPdD47unHt4wwSy42mpTdufOcgVbKeEYZrUBNMBotNr6+aRI7+0ub3LCa3qRjaSHwcD21fnHc0zXQ3Ccq4dMVn0S7Aia6N0Bg4wZ5ju8Uc1r4GJNIzLmmP6j9V7anm2gZJxN/lxylEUMqojMbeb70Mu8N5aKZyhbX1TPspfUdKBn7/d02qtyFRedT43uyxQlbPL904hsn3nFEoZ0kRCGpD+JZL9dhsWSmjIBVjbBuRiJyOy8UHgUbvaWXJgjllOUECsGWFpqQlnv4GiMX+N1LtYHeN03TCKEGh1gvctQASFz2fMCzNuyvlJ5Nfd/efC/S70EVYH6IfcTWeH1UogcRTBTVKYlHMB+a4DaRSzE5tLkyOS9IkvQoTtams5GibusGpfGtn6wJh+hqP9O0L5DJydzuyozNxBn4F9WHtddeiCrvirNF0m1+FaxZRI5woQ== joe@interceptor"
}
