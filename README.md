This is a modification of the original generate-accession-identifiers plugin with
2 significant differences:

identifier format is  `ORG-CODE YYYY NNN` 
where org-code is the repository organization/agency code or the repository short name if no agency code is set for that repo.

It keeps a separate sequence counter in the DB for each ORG-CODE,YEAR for example:
sequence_name: GENERATE_ACCESSION_IDENTIFIER_ViU_2018

This plugin is enabled by the pre-populate-records preference setting.
 ( preferences/defaults/default_values = true )
If default_values is false or unset (nil), then plugin will not generate accession ids. 

In the staff UI, this is labeled as 'Pre-populate Records?' with a checkbox for boolean values.
This can be set on a User,Repository or Global basis.

Note that because the value can have 3 possible settings ( true, false, nil ), but the checkbox can represent only 2 values,
there can be some confusion over whether a value is unset (nil), which cause it to fallthru to the next level of settings, or false, which causes it to return false.

---------

This plugin adds automatic identifier generation to the "Create
Accession" form.  The form will default to an identifier such as:

  YYYY NNN

Where YYYY is the current year, and NNN is a sequence number.

To install, just activate the plugin in your config/config.rb file by
including an entry such as:

     AppConfig[:plugins] = ['generate-accession-identifiers-plugin']
