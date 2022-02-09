public class TaskManager {
	public static List<Task> getTasks(List<Id> accountIds){
        List<Task> tasks = [
            SELECT Id, WhatId, OwnerId
            FROM Task 
            WHERE WhatId IN :accountIds
        ];
        return tasks;
    }
}