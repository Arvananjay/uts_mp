import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aplikasi5b/main.dart'; // pastikan sesuai nama package kamu di pubspec.yaml

void main() {
  testWidgets('Menampilkan halaman portofolio dengan nama dan keahlian', (
    WidgetTester tester,
  ) async {
    // Jalankan aplikasi utama
    await tester.pumpWidget(const MyPortfolioApp());

    // Verifikasi bahwa judul app bar muncul
    expect(find.text('My Portfolio'), findsOneWidget);

    // Verifikasi bahwa nama pemilik portofolio muncul
    expect(find.text('Arvan Fudoli'), findsOneWidget);

    // Verifikasi bahwa bagian keahlian muncul
    expect(find.text('💡 Keahlian Saya'), findsOneWidget);

    // Verifikasi salah satu skill chip muncul
    expect(find.text('Flutter'), findsOneWidget);

    // Verifikasi bagian pendidikan ada
    expect(find.text('🎓 Pendidikan'), findsOneWidget);

    // Verifikasi email tampil
    expect(find.text('arvanfudoli@gmail.com'), findsOneWidget);
  });

  testWidgets('Scroll halaman portofolio berhasil', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyPortfolioApp());

    // Pastikan ada widget Scrollable (karena pakai SingleChildScrollView)
    expect(find.byType(Scrollable), findsOneWidget);

    // Lakukan aksi scroll
    await tester.drag(
      find.byType(SingleChildScrollView),
      const Offset(0, -300),
    );
    await tester.pump();

    // Tes tetap bisa menemukan teks footer
    expect(find.textContaining('© 2025 Arvan Fudoli'), findsOneWidget);
  });
}
