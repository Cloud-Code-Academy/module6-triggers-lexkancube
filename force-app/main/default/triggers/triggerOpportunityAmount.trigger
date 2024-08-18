trigger OpportunityAmount on Opportunity (before update) {
    // Loop through each Opportunity being updated
    for (Opportunity opp : Trigger.new) {
        // Check if the Amount is less than or equal to 5000
        if (opp.Amount <= 5000) {
            // Add an error to the Amount field that will prevent the record from being saved
            opp.addError('Opportunity amount must be greater than 5000');
        }
    }
}