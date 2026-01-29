import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/services/common/fuzzy_search_service.dart';
import 'package:ytnkio/widgets/common/default_text_form_field.dart';

class AutocompleteTextFormField extends StatefulWidget {
  final String searchList;
  final TextEditingController controller;

  final TextInputType keyboardType;
  final String helperText;
  final String labelText;
  final IconData icon;

  const AutocompleteTextFormField(
      {super.key,
      required this.searchList,
      required this.controller,
      required this.keyboardType,
      required this.helperText,
      required this.labelText,
      required this.icon});

  @override
  State<AutocompleteTextFormField> createState() => _AutocompleteTextFormFieldState();
}

class _AutocompleteTextFormFieldState extends State<AutocompleteTextFormField> {
  final FuzzySearchService _fuzzySearchService = FuzzySearchService();
  List<String> _options = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    if (widget.controller.text.isNotEmpty) {
      _searchOptions(widget.controller.text);
    } else {
      setState(() {
        _options = [];
      });
    }
  }

  Future<void> _searchOptions(String query) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final results = await _fuzzySearchService.search(widget.searchList, query);
      if (mounted) {
        setState(() {
          _options = results;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _options = [];
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<String>(
      textEditingController: widget.controller,
      focusNode: FocusNode(),
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return _options;
      },
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted,
      ) {
        return DefaultTextFormField(
          icon: widget.icon,
          helperText: widget.helperText,
          labelText: widget.labelText,
          keyboardType: widget.keyboardType,
          controller: textEditingController,
          focusNode: focusNode,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
        );
      },
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<String> onSelected,
        Iterable<String> options,
      ) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: SizedBox(
              height: 200.0,
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: ListTile(
                            title: Text(option),
                          ),
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
