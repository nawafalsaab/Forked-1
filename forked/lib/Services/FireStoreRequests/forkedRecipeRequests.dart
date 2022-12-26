import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forked/Models/forkedRecipe.dart';
import 'package:forked/Models/originalRecipie.dart';
import 'package:get/get.dart';

final db = FirebaseFirestore.instance;

setForkedRecipe(
    {
    String? parentName,
    String? parentID,
    String? userID,
    String? imgPath,
    String? title,
    int? minutes,
    int? servings,
    int? calories,
    int? likes,
    String? ingredients,
    String? preperation,
    String? userProfileImage,
    String? username}) async {
  // User appt =
  //     User(userID: id, email: email);
  try {
    final docRef = db.collection('forkedRecipe').doc();

    await docRef.set({
      "userID": userID,
      "username": username,
      "recipeID": docRef.id,
      "imgPath":imgPath,
      "title":title,
      "minutes":minutes,
      "servings":servings,
      "calories":calories,
      "likes":likes,
      "ingredients":ingredients,
      "preperation":preperation,
      "userProfileImage":userProfileImage,
      "parentName":parentName,
      "parentID":parentID

    });
    Get.snackbar("title", "set recipe is working");
  } catch (err) {
    Get.snackbar("title", "error inside set recipe");
  }
}






readForkedRecipeData({String? recipeID})async{
forkedRecipe returned=forkedRecipe();

 try{ 
   
   await db.collection("forkedRecipe").doc(recipeID).get().then(
  (DocumentSnapshot doc) {
returned= forkedRecipe.fronJson(doc.data() as Map<String, dynamic>);  
Get.snackbar("title", returned.imgPath.toString());  // ...
  },
  
);

return returned;


 }catch(err){Get.snackbar("title", "readUser");}

}





readUsersForkedlRecipies({String? userID})async{

List<forkedRecipe> userForkedRecipes=[];
try{
  await FirebaseFirestore.instance
    .collection('forkedRecipe').
   where('userID', isEqualTo: userID ) // we need to change username to userName
    .get() //Future<QuerySnapshot<Map<String, dynamic>>>
    .then((QuerySnapshot querySnapshot) {
      
        querySnapshot.docs.forEach((doc) {// QuerySnapshot<Object?>
       
userForkedRecipes.add(forkedRecipe.fronJson(doc.data() as Map<String, dynamic>));  

        });
    });

for (var element in userForkedRecipes) {
Get.snackbar("title", element.title.toString());
}
return userForkedRecipes;
}catch(err){


}
}