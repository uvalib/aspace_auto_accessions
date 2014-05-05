Yale Accessions README
----------------------

# Getting Started

Download the latest release from the Releases tab in Github:

  https://github.com/lcdhoffman/aspace_yale_accessions/releases

Unzip the release and move it to:

    /path/to/archivesspace/plugins

Enable the plugin by editing the file in `config/config.rb`:

    AppConfig[:plugins] = ['some_plugin', 'yale_accessions']

See also:

  https://github.com/archivesspace/archivesspace/blob/master/plugins/README.md

You will neeed to shutdown archivesspace and migrate the database:

     $ cd /path/to/archivesspace
     $ scripts/setup-database.sh

See also:

  https://github.com/archivesspace/archivesspace/blob/master/UPGRADING.md

# How it works

Users with "Manage Repository" permissions will see a new menu item in the
Repository settings menu (click the gear icon to the right of the selected
repository). Use the "Department Codes" setting to add and remove codes for
your Repository.

Department codes will appear in a dropdown for the second part of the Accession
identifier.

The first and third sections of the identifier will be system-generated upon
saving the record. The fourth section will be removed.




  
