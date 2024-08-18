trigger AccountTriggerShippingAddress on Account (before insert) {
    for (Account acc : Trigger.new) {
        // Check if the shipping fields are not empty
        if (!String.isEmpty(acc.ShippingStreet) || !String.isEmpty(acc.ShippingCity) || 
            !String.isEmpty(acc.ShippingState) || !String.isEmpty(acc.ShippingPostalCode) || 
            !String.isEmpty(acc.ShippingCountry)) {
            acc.BillingStreet = acc.ShippingStreet;
            acc.BillingCity = acc.ShippingCity;
            acc.BillingState = acc.ShippingState;
            acc.BillingPostalCode = acc.ShippingPostalCode;
            acc.BillingCountry = acc.ShippingCountry;
        }
    }
}
