resource "aws_dynamodb_table" "terraform-state-lock"{
    name = "abs"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LOCK-ID"
}