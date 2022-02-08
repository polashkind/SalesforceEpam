global class LaunchedFromFlow {
    @InvocableMethod
	public static void createTask(List<Account> accList) {
        List<Task> taskList = new List<Task>();
        Account acc = accList[0];

        Task task = new Task();
        task.Subject = 'Negotiations with ' + acc.Name;
        task.Status = 'Open';
        task.Priority = 'Normal';
        task.WhatId = acc.ID;
        task.OwnerId = acc.OwnerId;
        taskList.add(task);

        if(taskList!=null && taskList.size()>0) {
            insert taskList;
        }
	}
}