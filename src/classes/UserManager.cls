public class UserManager {
    public static List<User> getUsers(){
        List<User> users = [
                SELECT Id
                FROM User
                WHERE IsActive = True
        ];
        return users;
    }
}