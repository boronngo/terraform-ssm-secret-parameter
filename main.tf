resource "aws_ssm_parameter" "parameter" {
  name  = "secret-value"
  value = data.aws_kms_secrets.secret.plaintext["encrypted_password"]
  type  = "SecureString"
}

resource "aws_kms_key" "key" {}

resource "aws_kms_alias" "key" {
  name = "alias/my-key"
  target_key_id = aws_kms_key.key.key_id
}

data "aws_kms_secrets" "secret" {
  secret {
    name = "encrypted_password"
    payload = "AQICAHimf8iLOLtVRvCS7gocES8/R9T3H5C3H+fHz+vv/Ge3vQEeVUSRRMshcOmmdQpmrn+yAAAAZjBkBgkqhkiG9w0BBwagVzBVAgEAMFAGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMJ7wHL45rGR0OBxfdAgEQgCMymvkZCDinncn31/YQ0azDqMz7lOcyAv/6feJmBP2GeN7BuQ=="
  }
}