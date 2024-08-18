trigger AccountTrigger on Account (before insert) {
    for (Account acc : Trigger.new) {
        if (acc.Phone != null && acc.Website != null && acc.Fax != null) {
            acc.Rating = 'Hot';
        }
    }
}