trigger AccountTriggerDefaultContact on Account (after insert) {

    // Create a list to hold the new contacts
    List<Contact> contactsToInsert = new List<Contact>();

    // Iterate over each new Account
    for(Account acc : Trigger.new) {
        // Create a new Contact for each Account
        Contact newContact = new Contact(
            LastName = 'DefaultContact',
            Email = 'default@email.com',
            AccountId = acc.Id // Relate the contact to the account
        );
        // Add the new contact to the list
        contactsToInsert.add(newContact);
    }

    // Insert all contacts in bulk
    if (!contactsToInsert.isEmpty()) {
        insert contactsToInsert;
    }
}