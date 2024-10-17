@isTest
public class SiteLocationTriggerHandlerTest {
    @isTest
    static void testHandleBeforeInsertOrUpdate() {
        List<SiteLocation__c> siteLocations = new List<SiteLocation__c>{
            new SiteLocation__c(ExternalID__c = 'ExternalID1'),
            new SiteLocation__c(ExternalID__c = 'ExternalID2'),
            new SiteLocation__c(ExternalID__c = 'ExternalID3')
        };

        Test.startTest();
        SiteLocationTriggerHandler.handleBeforeInsertOrUpdate(siteLocations);
        Test.stopTest();

        for (SiteLocation__c site : siteLocations) {
            System.assertEquals(site.ExternalID__c, site.Name, 'Name field must be like ExternalID__c');
        }
    }

    @isTest
    static void testHandleBeforeUpdate() {
        SiteLocation__c siteLocation = new SiteLocation__c(ExternalID__c = 'OldExternalID');
        insert siteLocation;

        siteLocation.ExternalID__c = 'UpdatedExternalID';

        Test.startTest();
        SiteLocationTriggerHandler.handleBeforeInsertOrUpdate(new List<SiteLocation__c>{ siteLocation });
        update siteLocation;
        Test.stopTest();

        siteLocation = [SELECT Name, ExternalID__c FROM SiteLocation__c WHERE Id = :siteLocation.Id];
        System.assertEquals(siteLocation.ExternalID__c, siteLocation.Name, 'Name field must be like ExternalID__c after update');
    }
}