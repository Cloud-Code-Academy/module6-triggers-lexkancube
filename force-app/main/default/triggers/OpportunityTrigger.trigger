trigger UpdatePrimaryContactOnOpportunity on Opportunity (after update) {
    // List to hold the opportunities that need updating
    List<Opportunity> oppsToUpdate = new List<Opportunity>();
    
    // Iterate through each updated opportunity
    for(Opportunity opp : Trigger.new) {
        // Only proceed if the opportunity has an AccountId
        if(opp.AccountId != null) {
            // Query to find the CEO contact for the related account
            Contact ceoContact = [SELECT Id FROM Contact WHERE AccountId = :opp.AccountId AND Title = 'CEO'LIMIT 1
            ];
            
            // If a CEO contact is found, update the opportunity's primary contact field
            if(ceoContact != null) {
                opp.Primary_Contact__c = ceoContact.Id;
                oppsToUpdate.add(opp);
            }
        }
    }
    
    // Update the opportunities with the new primary contact
    if(!oppsToUpdate.isEmpty()) {
        update oppsToUpdate;
    }
}