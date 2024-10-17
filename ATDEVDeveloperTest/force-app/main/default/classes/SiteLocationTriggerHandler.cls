public class SiteLocationTriggerHandler {
    public static void handleBeforeInsertOrUpdate(List<SiteLocation__c> siteLocations) {
        for (SiteLocation__c site : siteLocations) {
            site.Name = site.ExternalID__c;
        }
    }
}