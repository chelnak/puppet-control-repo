# A Puppet Control Repository

## What You Get From This control-repo

This is a template [control repository](https://puppet.com/docs/pe/latest/control_repo.html) that has the minimum amount of scaffolding to make it easy to get started with [r10k](https://puppet.com/docs/pe/latest/r10k.html) or Puppet Enterprise's [Code Manager](https://puppet.com/docs/pe/latest/code_mgr.html).

The important files and items in this template are as follows:

* Basic example of roles and profiles.
* An example Puppetfile with various module references.
* An example Hiera configuration file and data directory with pre-created common.yaml and nodes directory.
  * These match the default hierarchy that ships with PE.
* An [environment.conf](https://puppet.com/docs/puppet/7/config_file_environment.html) that correctly implements:
  * A site-modules directory for roles, profiles, and any custom modules for your organization.
  * A config\_version script.
* An example [config\_version](https://puppet.com/docs/puppet/7/config_file_environment.html#environment-conf-allowed-settings) script that outputs the git commit ID of the code that was used during a Puppet run.

Here's a visual representation of the structure of this repository:

```bash
control-repo/
├── data/                                 # Hiera data directory.
│   ├── nodes/                            # Node-specific data goes here.
│   └── common.yaml                       # Common data goes here.
├── manifests/
│   └── site.pp                           # The "main" manifest that contains a default node definition.
├── scripts/
│   ├── code_manager_config_version.rb    # A config_version script for Code Manager.
│   ├── config_version.rb                 # A config_version script for r10k.
│   └── config_version.sh                 # A wrapper that chooses the appropriate config_version script.
├── site-modules/                         # This directory contains site-specific modules and is added to $modulepath.
│   ├── profile/                          # The profile module.
│   └── role/                             # The role module.
├── LICENSE
├── Puppetfile                            # A list of external Puppet modules to deploy with an environment.
├── README.md
├── environment.conf                      # Environment-specific settings. Configures the modulepath and config_version.
└── hiera.yaml                            # Hiera's configuration file. The Hiera hierarchy is defined here.
```
