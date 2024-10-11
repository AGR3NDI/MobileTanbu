import 'package:flutter/material.dart';

class AbsenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('Absensi'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo.png', width: 50, height: 50), // Logo custom
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section for name, faculty, department, and year
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nama : ', style: TextStyle(fontSize: 16)),
                      Text('Angkatan : ', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Fakultas : ', style: TextStyle(fontSize: 16)),
                      Text('Jurusan : ', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Table for attendance
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Nama')),
                    DataColumn(label: Text('Tanggal')),
                    DataColumn(label: Text('Hadir')),
                  ],
                  rows: List.generate(7, (index) {
                    return DataRow(cells: [
                      DataCell(Text((index + 1).toString())), // No
                      DataCell(Text('Nama $index')), // Nama (replace with dynamic data)
                      DataCell(Text('dd-mm-yyyy')), // Tanggal (replace with dynamic data)
                      DataCell(Checkbox(value: false, onChanged: (val) {})), // Hadir
                    ]);
                  }),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Buttons at the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400], // Kembali button style
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Go back
                  },
                  child: Text('< Kembali'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700], // Submit button style
                  ),
                  onPressed: () {
                    // Handle submit action
                  },
                  child: Text('Submit'),
                ),

              ],
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[300],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_home.png', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_mutasi.png', width: 24, height: 24),
            label: 'Mutasi',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  'assets/icon_qr_code.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_info.png', width: 24, height: 24),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_profile.png', width: 24, height: 24),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Set the current index
        onTap: (index) {
          switch (index) {
            case 0: // Home
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1: // Mutasi
              Navigator.pushReplacementNamed(context, '/mutasi');
              break;
            case 2: // QR
            // Handle QR navigation
              break;
            case 3: // Info
              Navigator.pushReplacementNamed(context, '/info');
              break;
            case 4: // Profile
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}