global class FromFlowUpdateUser {
	@InvocableMethod
    public static void theLuckyUser(List<Account> accList){
        Account acc = accList[0];
        List<ID> ids = new List<ID>();
        ids.add(acc.Id);
        List<Task> tasks = TaskManager.getTasks(ids);
        if(tasks.size() >= 3){
            List<User> activeUser = [
                SELECT Id
                FROM User
                WHERE IsActive = True
            ];
            Integer randomUserIndex = math.round(math.random()*activeUser.size());
            User randomUser = activeUser[randomUserIndex];
            for(Task task : tasks){
                task.OwnerId = randomUser.Id;
            }
            update tasks;
        }
            
    }
}