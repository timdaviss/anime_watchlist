import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/core_providers.dart';
import '../domain/anime_entry.dart';
import 'export_providers.dart';

class ExportImportScreen extends ConsumerStatefulWidget {
  const ExportImportScreen({super.key});

  @override
  ConsumerState<ExportImportScreen> createState() => _ExportImportScreenState();
}

class _ExportImportScreenState extends ConsumerState<ExportImportScreen> {
  final _importController = TextEditingController();

  bool _isBusy = false;

  @override
  void dispose() {
    _importController.dispose();
    super.dispose();
  }

  Future<void> _exportLibrary() async {
    if (_isBusy) {
      return;
    }

    setState(() {
      _isBusy = true;
    });

    try {
      final repository = ref.read(animeRepositoryProvider);
      final exportService = ref.read(libraryExportServiceProvider);
      final entries = await repository.watchAll().first;
      final jsonBackup = await exportService.exportToJson(entries);
      final file = await exportService.exportToFile(entries);

      await Clipboard.setData(ClipboardData(text: jsonBackup));

      if (!mounted) {
        return;
      }

      await showCupertinoDialog<void>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Export Complete'),
          content: Text(
            'Backed up ${entries.length} entries.\n\nSaved to:\n${file.path}\n\nJSON has also been copied to clipboard.',
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }

      await showCupertinoDialog<void>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Export Failed'),
          content: Text('Could not export your library: $error'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isBusy = false;
        });
      }
    }
  }

  Future<void> _pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text?.trim();
    if (text == null || text.isEmpty) {
      if (!mounted) {
        return;
      }
      await showCupertinoDialog<void>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Clipboard Empty'),
          content: const Text('No text found on clipboard.'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    _importController.text = text;
  }

  Future<void> _importLibrary() async {
    final jsonText = _importController.text.trim();
    if (jsonText.isEmpty || _isBusy) {
      return;
    }

    setState(() {
      _isBusy = true;
    });

    try {
      final exportService = ref.read(libraryExportServiceProvider);
      final repository = ref.read(animeRepositoryProvider);

      final importedEntries = await exportService.importFromJson(jsonText);
      final existingEntries = await repository.watchAll().first;

      final existingMalIds = existingEntries
          .map((entry) => entry.malId)
          .whereType<int>()
          .toSet();
      final existingAnilistIds = existingEntries
          .map((entry) => entry.anilistId)
          .whereType<int>()
          .toSet();
      final existingIds = existingEntries.map((entry) => entry.id).toSet();

      final importMalIds = <int>{};
      final importAnilistIds = <int>{};
      final importIds = <String>{};

      final entriesToInsert = <AnimeEntry>[];
      var skippedCount = 0;

      for (final entry in importedEntries) {
        final hasDuplicateMalId =
            entry.malId != null &&
            (existingMalIds.contains(entry.malId) ||
                importMalIds.contains(entry.malId));
        final hasDuplicateAnilistId =
            entry.anilistId != null &&
            (existingAnilistIds.contains(entry.anilistId) ||
                importAnilistIds.contains(entry.anilistId));
        final hasDuplicateId =
            existingIds.contains(entry.id) || importIds.contains(entry.id);

        if (hasDuplicateMalId || hasDuplicateAnilistId || hasDuplicateId) {
          skippedCount++;
          continue;
        }

        entriesToInsert.add(entry);
        importIds.add(entry.id);
        if (entry.malId != null) {
          importMalIds.add(entry.malId!);
        }
        if (entry.anilistId != null) {
          importAnilistIds.add(entry.anilistId!);
        }
      }

      if (!mounted) {
        return;
      }

      final shouldImport =
          await showCupertinoDialog<bool>(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text('Confirm Import'),
              content: Text(
                'Found ${importedEntries.length} entries.\n'
                'Will import ${entriesToInsert.length} new entries and skip $skippedCount duplicates.',
              ),
              actions: [
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Import'),
                ),
              ],
            ),
          ) ??
          false;

      if (!shouldImport) {
        return;
      }

      for (final entry in entriesToInsert) {
        await repository.insertEntry(entry);
      }

      if (!mounted) {
        return;
      }

      await showCupertinoDialog<void>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Import Complete'),
          content: Text(
            'Imported ${entriesToInsert.length} entries. Skipped $skippedCount duplicates.',
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } on FormatException catch (error) {
      if (!mounted) {
        return;
      }
      await showCupertinoDialog<void>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Invalid Backup'),
          content: Text(error.message),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }
      await showCupertinoDialog<void>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Import Failed'),
          content: Text('Could not import backup: $error'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isBusy = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Export / Import'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Export',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Export your entire library as a JSON backup file.',
              style: TextStyle(
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton.filled(
                onPressed: _isBusy ? null : _exportLibrary,
                child: _isBusy
                    ? const CupertinoActivityIndicator()
                    : const Text('Export Library'),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Import',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Paste a previously exported JSON backup to restore entries.',
              style: TextStyle(
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                onPressed: _isBusy ? null : _pasteFromClipboard,
                child: const Text('Paste from Clipboard'),
              ),
            ),
            const SizedBox(height: 8),
            CupertinoTextField(
              controller: _importController,
              placeholder: 'Paste JSON backup here...',
              maxLines: 8,
              padding: const EdgeInsets.all(12),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton.filled(
                onPressed: _isBusy ? null : _importLibrary,
                child: _isBusy
                    ? const CupertinoActivityIndicator()
                    : const Text('Import Library'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
