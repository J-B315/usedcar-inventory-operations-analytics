# Privacy & Publishing Checklist

Before making this repository public, verify that you are permitted to publish the embedded business data in the PBIX.

## Do not publish

- Original operational Excel workbooks
- Full VINs
- Employee email addresses or personal contact information
- Carfax URLs tied to full vehicle identifiers
- Customer information
- Internal notes that are not necessary for the portfolio
- Any data restricted by an employer, client, NDA, or internal policy

## Current portfolio approach

- Full VINs were replaced with masked references.
- Salesperson identities were anonymized.
- The original source workbook is excluded.
- The repository provides a data dictionary instead of the original row-level source.

## PBIX warning

A PBIX can contain embedded row-level data even when that data is not visible on a report page. Treat the PBIX itself as a data-bearing artifact. If there is any uncertainty about permission to publish the underlying operational data, share screenshots/PDF publicly and provide the PBIX only privately to recruiters or interviewers.
