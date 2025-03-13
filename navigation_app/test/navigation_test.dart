import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation_app/main.dart';
import 'package:navigation_app/home_page.dart';
import 'package:navigation_app/about_page.dart';
import 'package:navigation_app/contact_page.dart';

void main() {
  testWidgets('Test de navigation entre les pages', (WidgetTester tester) async {
    // Démarre l'application
    await tester.pumpWidget(MyApp());

    // Vérifie qu'on est sur la page d'accueil
    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Go to About Page'), findsOneWidget);
    expect(find.text('Go to Contact Page'), findsOneWidget);

    // Naviguer vers la page "About"
    await tester.tap(find.text('Go to About Page'));
    await tester.pumpAndSettle();

    // Vérifie qu'on est bien sur la page "About"
    expect(find.text('About Page'), findsOneWidget);
    expect(find.text('Go Back'), findsOneWidget);

    // Revenir en arrière
    await tester.tap(find.text('Go Back'));
    await tester.pumpAndSettle();

    // Vérifie qu'on est revenu sur la page d'accueil
    expect(find.text('Home Page'), findsOneWidget);

    // Naviguer vers la page "Contact"
    await tester.tap(find.text('Go to Contact Page'));
    await tester.pumpAndSettle();

    // Vérifie qu'on est bien sur la page "Contact"
    expect(find.text('Contact Page'), findsOneWidget);
    expect(find.text('Go Back'), findsOneWidget);

    // Revenir en arrière
    await tester.tap(find.text('Go Back'));
    await tester.pumpAndSettle();

    // Vérifie qu'on est revenu sur la page d'accueil
    expect(find.text('Home Page'), findsOneWidget);
  });
}
