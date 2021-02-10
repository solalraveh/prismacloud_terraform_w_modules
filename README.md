# prismacloud_terraform_w_modules

Working TF repo, with modules, to provision a compliance standard (with requirement and section) and a set of policies and their respective searches (as modules).
If you want to add more policies, add them in the respective tf files (i.e. `compliance_policies_PANW_ec2.tf` or a new one).
If you want to provision more compliance standards, add them in the `compliance_framework.tf` file.
The provider config file is/can be expected at the `.prismacloud_auth.json` file.
An example config structure can look like:
```
{
    "url": "api.eu.prismacloud.io", 
    "username": "yada_access_key", 
    "password": "yada_secret_key", 
    "protocol": "https"
}
```
Another config parameter might be necessary if you don't opt for access/secret key but rather username/pass, that'll be: `customer_name` and corresponding env variable `PRISMACLOUD_CUSTOMER_NAME`.
If you use access/secret key, that won't be necessary. 

Unless if you want to put the provider configs in a config file, then export your env var, similar to:

```
export PRISMACLOUD_USERNAME=yada_access_key
export PRISMACLOUD_PASSWORD=yada_secret_key
export PRISMACLOUD_URL=api.eu.prismacloud.io
export PRISMACLOUD_PROTOCOL=https
```

Full details at:
https://registry.terraform.io/providers/PaloAltoNetworks/prismacloud/latest/docs
