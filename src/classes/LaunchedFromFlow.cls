global class LaunchedFromFlow {
    @InvocableMethod
    public static void createTask(List<Account> accountList) {
        for (Account account : accountList) {
            if (Account.CreatedDate == Account.LastModifiedDate) {
                List<Task> taskList = new List<Task>();
                Task task = new Task();
                task.Subject = 'Negotiations with ' + account.Name;
                task.Status = 'Open';
                task.Priority = 'Normal';
                task.WhatId = account.Id;
                task.OwnerId = account.OwnerId;
                taskList.add(task);
                insert taskList;
            } else {
                List<Id> ids = new List<Id>();
                ids.add(account.Id);
                List<Task> tasks = TaskManager.getTasks(ids);
                if (tasks.size() >= 3) {
                    List<User> activeUser = UserManager.getUsers();
                    Integer randomUserIndex = math.round(math.random() * activeUser.size());
                    User randomUser = activeUser[randomUserIndex];
                    for (Task task : tasks) {
                        task.OwnerId = randomUser.Id;
                    }
                    update tasks;
                }
            }
        }
    }
}