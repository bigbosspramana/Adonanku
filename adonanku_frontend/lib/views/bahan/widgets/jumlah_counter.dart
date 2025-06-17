import 'package:adonanku_frontend/viewmodels/bahan_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JumlahCounter extends ConsumerStatefulWidget {
  final int jumlah;

  const JumlahCounter({super.key, required this.jumlah});

  @override
  ConsumerState<JumlahCounter> createState() => _JumlahCounterState();
}

class _JumlahCounterState extends ConsumerState<JumlahCounter> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.jumlah.toString());
  }

  @override
  void didUpdateWidget(JumlahCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.jumlah != int.tryParse(_controller.text)) {
      _controller.text = widget.jumlah.toString();
    }
  }

  void _updateJumlah(int newJumlah) {
    if (newJumlah >= 0) {
      ref.read(bahanViewModelProvider.notifier).updateJumlah(newJumlah);
      _controller.text = newJumlah.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD1D1D1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Tombol kurang
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              final current = int.tryParse(_controller.text) ?? 0;
              if (current > 0) {
                _updateJumlah(current - 1);
              }
            },
          ),

          // Input jumlah manual
          SizedBox(
            width: 30,
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontFamily: 'Radio Canada',
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
              ),
              onChanged: (value) {
                final parsed = int.tryParse(value);
                if (parsed != null && parsed >= 0) {
                  _updateJumlah(parsed);
                }
              },
            ),
          ),

          // Tombol tambah
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              final current = int.tryParse(_controller.text) ?? 0;
              _updateJumlah(current + 1);
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
