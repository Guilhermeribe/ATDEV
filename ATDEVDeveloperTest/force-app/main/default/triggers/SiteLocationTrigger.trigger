trigger SiteLocationTrigger on SiteLocation__c (before insert, before update) {
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        SiteLocationTriggerHandler.handleBeforeInsertOrUpdate(Trigger.new);
    }
}