This is a modification of the original generate-accession-identifiers plugin with
2 significant differences:

identifier format is  `ORG-CODE YYYY NNN` 
where org-code is the repository organization/agency code or the repository short name if no agency code is set for that repo.

This plugin is engaged by the pre-populate-records preference setting. 
 ( preferences/defaults/default_values = true )
If default_values is false or unset (nil), then plugin will not generate accession ids. 


---------

This plugin adds automatic identifier generation to the "Create
Accession" form.  The form will default to an identifier such as:

  YYYY NNN

Where YYYY is the current year, and NNN is a sequence number.

To install, just activate the plugin in your config/config.rb file by
including an entry such as:

     AppConfig[:plugins] = ['generate-accession-identifiers-plugin']
