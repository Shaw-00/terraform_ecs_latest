resource "aws_db_instance" "postgresdb1" {
    name                  = "postgresdb1"
    parameter_group_name     = "default.postgres13" # if you have tuned it
    password                 = data.aws_ssm_parameter.password.value
    allocated_storage        = 256 # gigabytes
    backup_retention_period  = 7   # in days
    db_subnet_group_name     =  "${aws_db_subnet_group.db-subnet.name}"
    engine                   = "postgres"
    engine_version           = "13.7"
    identifier               = "mydb2"
    instance_class           = "db.t3.micro"
    multi_az                 = false
    port                     = 5432
    publicly_accessible      = true
    storage_encrypted        = true # you should always do this
    storage_type             = "gp2"
    username                 = "mydb1"
    vpc_security_group_ids   = ["${aws_security_group.Terraform_sg.id}"]
}

resource "aws_db_subnet_group" "db-subnet" {
name = "rdsgroup"
subnet_ids = ["${aws_default_subnet.default_subnet_a.id}", "${aws_default_subnet.default_subnet_b.id}", "${aws_default_subnet.default_subnet_c.id}"]
}

output "rds_endpoint" {
  value = "${aws_db_instance.postgresdb1.endpoint}"
}
