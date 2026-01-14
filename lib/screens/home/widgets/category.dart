import 'package:flutter/material.dart';
import 'package:mini_ecommerce/data/category_data.dart';

// La catégorie sélectionnée est contrôlée par le parent (HomeScreen).
class Category extends StatelessWidget {

  // Catégorie actuellement sélectionnée
  final String selectedCategory;

  // Callback pour notifier le parent lors d’un clic
  final Function(String) onCategorySelected;

  const Category({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {

    // SizedBox impose une hauteur fixe
    // obligatoire pour un ListView horizontal
    return SizedBox(
      height: 110,

      //---------------- Liste des catégories ----------------
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,

        // Espacement constant entre chaque catégorie
        separatorBuilder: (context, index) =>
        const SizedBox(width: 20),

        //---------------- Constructeur de catégorie ----------------
        itemBuilder: (context, index) {

          // Catégorie courante
          final category = categories[index];

          // Vérifie si la catégorie est active
          final bool isActive =
              category.title == selectedCategory;

          //---------------- Zone cliquable ----------------
          return GestureDetector(
            onTap: () {
              // Envoie la catégorie sélectionnée au parent
              onCategorySelected(category.title);
            },

            //---------------- Structure verticale ----------------
            child: Column(
              children: [
                //---------------- Image circulaire ----------------
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActive
                          ? category.color
                          : Colors.transparent,
                      width: 1.5,
                    ),
                    image: DecorationImage(
                      image: AssetImage(category.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                //---------------- Titre de la catégorie ----------------
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isActive
                        ? category.color.withAlpha(38)
                        : Colors.transparent,
                  ),
                  child: Text(
                    category.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isActive
                          ? category.color
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
