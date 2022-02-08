public class TaskManager {
	public static List<Task> getTasks(List<ID> accIds){
        List<Task> tasks = [
            SELECT Id, WhatId, OwnerId
            FROM Task 
            WHERE WhatId IN :accIds
        ];
        return tasks;
    }
}