

# Trinity Wizards - Alkaff Pretest

## Finished Features:

### Mandatory Task:
- ✅ At `Home Page`, you will see a bottom navigation bar; which is home & Profile
- ✅ At home, you will see all the contacts based on the information retrieved
from data.json as shown in the `Home Page` section. You will see the contact list
from the json. Also, the profile picture will be the first name initial, and last name
initial. 
- ✅ Also Clicking on any contact will redirect the user to their profile as shown in
`Contact Detail Page`.
- ✅ At `Contact Detail Page`, the user will be able to edit the contact’s
information. First name and Last Name are required fields, while Email and Phone
are optional fields. But once the email & phone are filled, you must add a validation
to check if the email or phone is valid -- Email should be validated to (using @
and .com). Also, if the first name and last name changes, should have change the
initial in the profile picture as well. Please keep in mind that date of birth should be
the date picker, you can use flutter in app widget for calendar picker. When editing
on the field, must have a `next` keyboard type, and must bring user to the next
input field.
- ✅ Clicking on the update button, will update the contact list at `Home
Page` section. Clicking remove button, will remove the contact list, need to pop the
page and go back to previous page after updating or removing the contacts.
- ✅ A pull to refresh at screen 1 will force the app to refresh the list
according to the information retrieved from data.json (so when you add, change, or
remove the contact, it will be reset to its initial data).
- ✅ The UI should be similar, even the icon provided in the figma.

### Optional Task:
- ✅ `Login Page`; you will save your login info in local
so if you re-run your app once you logged in you will see homepage instead of this
page. Please be aware that each data can have the same name, but different id. You
can found the id on `data.json`.
- ✅ if you logged in with one of the user credentials in data.json, you would
see the prefix `you` in the contact list, as shown in the home page Figma file above.
- ✅ The search and (+) FAB on `Home Page` must be there, but the
functionality can be omitted. You can search the contact list in the homepage
search bar, and add a new contact list if you press the (+) FAB.
- ✅ On the `Profile Page` you will see your phone number, email, and full
name (first and last name).
