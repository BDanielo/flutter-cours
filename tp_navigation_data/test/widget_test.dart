import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tp_navigation_data/main.dart';

void main() {
  testWidgets('Test de la navigation entre écrans et retour de données', (WidgetTester tester) async {
    // Lancer l'application
    await tester.pumpWidget(MyApp());

    // Vérifier que le champ de texte et le bouton sont présents
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Envoyer'), findsOneWidget);

    // Saisir du texte dans le champ
    await tester.enterText(find.byType(TextField), 'Test Flutter');

    // Appuyer sur le bouton "Envoyer"
    await tester.tap(find.text('Envoyer'));
    await tester.pumpAndSettle(); // Attendre la fin de l'animation de navigation

    // Vérifier que l'on est sur le deuxième écran et que le texte est bien affiché
    expect(find.text('Texte reçu : Test Flutter'), findsOneWidget);
    expect(find.text('Retour'), findsOneWidget);

    // Appuyer sur "Retour"
    await tester.tap(find.text('Retour'));
    await tester.pumpAndSettle(); // Attendre le retour

    // Vérifier que le texte retourné s'affiche sur le premier écran
    expect(find.text('Retour avec : Test Flutter'), findsOneWidget);
  });
}
