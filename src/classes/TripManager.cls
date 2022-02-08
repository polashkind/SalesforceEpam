public class TripManager {
    
	public static List<Trip__c> getByIds(Set<Id> tripIds){
    	List<Trip__c> trips = [
        	SELECT Minimum_Age__c, Start_Date__c
        	FROM Trip__c
        	WHERE Id IN :tripIds
        ];
        
     	return trips;
  	}
    
    public static List<Trip__c> getTripId(Set<Id> tripId){
        if (tripId == null) {
            return new List<Trip__c>();
        }
        
    	List<Trip__c> trip = [
        	SELECT Minimum_Age__c, 
            		Start_Date__c,
            		End_Date__c,
            		Seats__c
        	FROM Trip__c
        	WHERE Id IN :tripId
        ];
        
     	return trip;
  	}
}