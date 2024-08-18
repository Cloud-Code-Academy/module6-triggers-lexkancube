trigger OpportunityPreventDelete on Opportunity (before delete) {
    // Iterate over each Opportunity that is being deleted
    for (Opportunity opp : Trigger.old) {
        // Check if the Opportunity is Closed Won and the related Account's Industry is Banking
        if (opp.StageName == 'Closed Won' && opp.Account.Industry == 'Banking') {
            // Add an error to prevent deletion with the specified error message
            opp.addError('Cannot delete closed opportunity for a banking account that is won');
        }
    }
}