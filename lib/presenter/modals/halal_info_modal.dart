import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pizzajournals/presenter/modals/modal.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/single_checkbox.dart';
import 'package:pizzajournals/presenter/widgets/start_rating.dart';

import '../../data/source/network/models/pizza_review_model.dart';
import '../../data/states/discover/discover_bloc.dart';
import '../../data/states/discover/discover_event.dart';
import '../../data/states/discover/discover_state.dart';

class HalalInfoModal extends StatefulWidget {
  final Review? reviewData;
  final String pizzaType;
  const HalalInfoModal({super.key, required this.onSubmit,this.reviewData,required this.pizzaType});

  final Function(Map<String, dynamic> data) onSubmit;

  @override
  State<HalalInfoModal> createState() => _HalalInfoModalState();
}

class _HalalInfoModalState extends State<HalalInfoModal> {
  String dropdownPizzaTypeValue = 'Select Pizza Type';
  String dropdownCrustTypeValue = 'Select Thickness';
  String dropdownSauceTypeValue = 'Select Taste';
  String dropdownCheeseTypeValue = 'Select Taste';
  String dropdownSauceAmountTypeValue = 'Select Amount';
  String dropdownCheeseAmountTypeValue = 'Select Amount';
  final TextEditingController _descriptionController = TextEditingController();
  String description = '';
  int stars = 0;
  bool isCrispy = true;
  bool isDry = true;
  bool isFluffy = true;

  @override
  void initState() {
    super.initState();

    if (widget.reviewData != null) {
      // Prefill fields for editing
      stars = widget.reviewData!.stars!;

      // Properly capitalize the values to match dropdown items
      String capitalize(String s) => s[0].toUpperCase() + s.substring(1).toLowerCase();

      // // Handle pizza type
      // if (widget.reviewData!.pizzaType != null) {
      //   dropdownPizzaTypeValue = widget.reviewData!.pizzaType!;
      // }

      // Handle crust thickness
      if (widget.reviewData!.crust?.thickness != null) {
        String thickness = capitalize(widget.reviewData!.crust!.thickness!);
        dropdownCrustTypeValue = ['Select Thickness', 'Thick', 'Thin', 'Average']
            .contains(thickness) ? thickness : 'Select Thickness';
      }

      // Handle sauce taste
      if (widget.reviewData!.sauce?.sweetOrSpicy != null) {
        String taste = capitalize(widget.reviewData!.sauce!.sweetOrSpicy!);
        dropdownSauceTypeValue = ['Select Taste', 'Sweet', 'Spicy', 'No Flavor', 'N/A']
            .contains(taste) ? taste : 'Select Taste';
      }

      // Handle cheese taste
      if (widget.reviewData!.cheese?.taste != null) {
        String taste = capitalize(widget.reviewData!.cheese!.taste!);
        dropdownCheeseTypeValue = ['Select Taste', 'Great', 'Ok', 'Ehh']
            .contains(taste) ? taste : 'Select Taste';
      }

      // Handle amounts
      if (widget.reviewData!.sauce?.amount != null) {
        String amount = capitalize(widget.reviewData!.sauce!.amount!);
        dropdownSauceAmountTypeValue = ['Select Amount', 'Light', 'Heavy', 'Average']
            .contains(amount) ? amount : 'Select Amount';
      }

      if (widget.reviewData!.cheese?.amount != null) {
        String amount = capitalize(widget.reviewData!.cheese!.amount!);
        dropdownCheeseAmountTypeValue = ['Select Amount', 'Light', 'Heavy', 'Average']
            .contains(amount) ? amount : 'Select Amount';
      }

     _descriptionController.text= description = widget.reviewData!.description ?? '';
      isCrispy = widget.reviewData!.crust?.crispy ?? false;
      isDry = widget.reviewData!.crust?.dry ?? false;
      isFluffy = widget.reviewData!.crust?.fluffy ?? false;
    }
  }


  DiscoverBloc get _discoverBloc => context.read<DiscoverBloc>();

  final ImagePicker _picker = ImagePicker();

  void _pickImage(int index) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // Use `ImageSource.camera` for camera
    );
    if (pickedFile != null) {
      _discoverBloc.add(DiscoverAddImage(File(pickedFile.path),   index));
    }
    // final XFile? pickedFile = await _picker.pickImage(
    //   source: ImageSource.gallery, // Use `ImageSource.camera` for camera
    // );
    // if (pickedFile != null) {
    //   // Placeholder image for simulation.
    //   setState(() {
    //     if (images.length == index)
    //       images.add(FileImage(File(pickedFile.path)));
    //     else
    //       images[index] = FileImage(File(pickedFile.path));
    //   });
    // }
  }

  Future<void> _addNewItem() async {
    if (_discoverBloc.state.images.length < 3) {
      _pickImage(_discoverBloc.state.images.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    final typographies = context.typographies;
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      builder: (_, scrollController) {
        return Material(

          // Wrap with Material widget
          child: Modal(
            title: widget.reviewData != null ? 'Update Review' : 'Add Review',

            showRightExitButton: true,
            onRightExitButtonPressed: () => Navigator.of(context).pop(),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, // Padding for keyboard
              ) + const EdgeInsets.symmetric(horizontal: 16.0),


              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StarRating(
                      initialRating: stars, // Use stars instead of 0
                      onRatingSelected: (rating) {
                        setState(() {
                          stars = rating;
                        });
                      },
                    ),

                    const SizedBox(height: 16),
                    // const Text("Pizza Type"), // Add spacing
                    // const SizedBox(height: 5), // Add spacing
                    // Container(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8),
                    //     border: Border.all(color: AppColors.grey2, width: 1),
                    //   ),
                    //   child: _buildSauceAmountDropDown(),
                    // ),
                    // const SizedBox(height: 16),
                    const Text("Crust Type",style: TextStyle(fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Crust Thickness",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.grey2, width: 1),
                                ),
                                child: _buildCrustTypeDropDown(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Crispy",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SingleSelectableCheckbox(
                                onSubmit: (value) {
                                  setState(() {
                                    isCrispy = value == 'yes';
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Dry",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SingleSelectableCheckbox(
                                onSubmit: (String value) {
                                  setState(() {
                                    isDry = value == 'yes';
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Fluffy",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SingleSelectableCheckbox(
                                onSubmit: (String value) {
                                  setState(() {
                                    isFluffy = value == 'yes';
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text("Sauce"), // Add spacing
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Sweet or Spicy",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.grey2, width: 1),
                                ),
                                child: _buildSauceDown(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Sauce Amount",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.grey2, width: 1),
                                ),
                                child: _buildSauceAmountDown(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    const Text("Cheese"), // Add spacing
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Cheese Taste",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.grey2, width: 1),
                                ),
                                child: _buildCheeseTasteDown(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Cheese Amount",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.grey2, width: 1),
                                ),
                                child: _buildCheeseAmountDown(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    const Align(
                      child: Text("Photos"),
                      alignment: Alignment.centerLeft,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: BlocBuilder<DiscoverBloc, DiscoverState>(
                        builder: (context, state) {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: state.images.length + 1,
                            itemBuilder: (context, index) {
                              if (index == state.images.length) {
                                return GestureDetector(
                                  onTap: _addNewItem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(Icons.add,
                                        size: 40, color: Colors.grey[700]),
                                  ),
                                );
                              }

                              final image = state.images[index];
                              return GestureDetector(
                                onTap: () => _pickImage(index),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                    image: image != null
                                        ? DecorationImage(
                                            image: FileImage(image),
                                            fit: BoxFit.cover)
                                        : null,
                                  ),
                                  child: image == null
                                      ? Icon(Icons.upload,
                                          size: 40, color: Colors.grey[700])
                                      : null,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    TextField(
                      maxLines: 4,
                      controller:  _descriptionController,
                        onChanged: (value) {
                        setState(() {
                          description = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your description here...",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: AppColors.main,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: GestureDetector(
                          onTap: () {
                            // Validation logic
                            if (stars == 0) {
                              final overlay = Overlay.of(context);
                              final overlayEntry = OverlayEntry(
                                builder: (context) => Positioned(
                                  top: MediaQuery.of(context).padding.top + 10, // Adjust for status bar
                                  left: 20,
                                  right: 20,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        "Please select a star rating.",
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              );

                              overlay.insert(overlayEntry);

                              Future.delayed(const Duration(seconds: 2), () {
                                overlayEntry.remove();
                              });
                              return;
                            }

                            // Check other required fields
                            if (

                                //dropdownCrustTypeValue == 'Select Thickness' ||
                                dropdownSauceTypeValue == 'Select Taste' ||
                                dropdownCheeseTypeValue == 'Select Taste' ||
                                dropdownSauceAmountTypeValue == 'Select Amount' ||
                                dropdownCheeseAmountTypeValue == 'Select Amount' )
                              // || _discoverBloc.state.images.isEmpty)
                            {

                              final overlay = Overlay.of(context);
                              final overlayEntry = OverlayEntry(
                                builder: (context) => Positioned(
                                  top: MediaQuery.of(context).padding.top + 10,
                                  left: 20,
                                  right: 20,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        "Please select all required options.",
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              );

                              overlay.insert(overlayEntry);

                              Future.delayed(const Duration(seconds: 2), () {
                                overlayEntry.remove();
                              });
                              return;
                            }

                            // If validation passes, prepare data
                            Map<String, dynamic> data = {
                              "stars": stars,
                              "pizzaType":widget.pizzaType,
                             // dropdownPizzaTypeValue != 'Select Pizza Type' ? dropdownPizzaTypeValue : '',
                              "description": description,
                              "thickness": dropdownCrustTypeValue.toLowerCase(),
                              "crispy": isCrispy ? 'yes' : 'no',
                              "dry": isDry ? 'yes' : 'no',
                              "fluffy": isFluffy ? 'yes' : 'no',
                              "sweetOrSpicy": dropdownSauceTypeValue.toLowerCase(),
                              "amount": dropdownSauceAmountTypeValue.toLowerCase(),
                              "cheeseAmount": dropdownCheeseAmountTypeValue.toLowerCase(),
                              "taste": dropdownCheeseTypeValue.toLowerCase(),
                            };

                            widget.onSubmit(data);
                          },

                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.main,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              widget.reviewData != null ? "Update" : "Submit",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),

                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget _buildSauceAmountDropDown() {
  //   return DropdownButton<String>(
  //     value: dropdownPizzaTypeValue,
  //     icon: const Icon(Icons.arrow_drop_down), // Use built-in dropdown icon
  //     elevation: 16,
  //     style: const TextStyle(color: AppColors.black),
  //     underline: Container(height: 0), // Hide underline
  //     onChanged: (String? newValue) {
  //       setState(() {
  //         dropdownPizzaTypeValue = newValue!;
  //       });
  //     },
  //     items: <String>[
  //       'Select Pizza Type',
  //       'Traditional Round',
  //       'Sicilian/Square',
  //       'Personal',
  //       'Grandma/Square',
  //       'Deep Dish',
  //     ].map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(
  //           value,
  //           overflow: TextOverflow.ellipsis,
  //           maxLines: 1,
  //           style: TextStyle(
  //             color: value == 'Select Pizza Type' ? AppColors.grey : AppColors.black,
  //           ),
  //         ),
  //       );
  //     }).toList(),
  //     isExpanded: true,
  //   );
  // }

  Widget _buildCrustTypeDropDown() {
    return DropdownButton<String>(
      value: dropdownCrustTypeValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: AppColors.black),
      underline: Container(height: 0), //
      onChanged: (String? newValue) {
        setState(() {
          dropdownCrustTypeValue = newValue!;
        });
      },
      items: <String>['Select Thickness', 'Thick', 'Thin', 'Average']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: value == 'Select Thickness' ? AppColors.grey : AppColors.black,
            ),
          ),
        );
      }).toList(),
      isExpanded: true,
    );
  }

  Widget _buildSauceDown() {
    return DropdownButton<String>(
      value: dropdownSauceTypeValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: AppColors.black),
      underline: Container(height: 0),
      onChanged: (String? newValue) {
        setState(() {
          dropdownSauceTypeValue = newValue!;
        });
      },
      items: <String>['Select Taste', 'Sweet', 'Spicy', 'No Flavor', 'N/A']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: value == 'Select Taste' ? AppColors.grey : AppColors.black,
            ),
          ),
        );
      }).toList(),
      isExpanded: true,
    );
  }

  Widget _buildSauceAmountDown() {
    return DropdownButton<String>(
      value: dropdownSauceAmountTypeValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: AppColors.black),
      underline: Container(height: 0),
      onChanged: (String? newValue) {
        setState(() {
          dropdownSauceAmountTypeValue = newValue!;
        });
      },
      items: <String>['Select Amount', 'Light', 'Heavy', 'Average']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: value == 'Select Amount' ? AppColors.grey : AppColors.black,
            ),
          ),
        );
      }).toList(),
      isExpanded: true,
    );
  }

  Widget _buildCheeseAmountDown() {
    return DropdownButton<String>(
      value: dropdownCheeseAmountTypeValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: AppColors.black),
      underline: Container(height: 0),
      onChanged: (String? newValue) {
        setState(() {
          dropdownCheeseAmountTypeValue = newValue!;
        });
      },
      items: <String>['Select Amount', 'Light', 'Heavy', 'Average']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: value == 'Select Amount' ? AppColors.grey : AppColors.black,
            ),
          ),
        );
      }).toList(),
      isExpanded: true,
    );
  }

  Widget _buildCheeseTasteDown() {
    return DropdownButton<String>(
      value: dropdownCheeseTypeValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: AppColors.black),
      underline: Container(height: 0),
      onChanged: (String? newValue) {
        setState(() {
          dropdownCheeseTypeValue = newValue!;
        });
      },
      items: <String>['Select Taste', 'Great', 'Ok', 'Ehh']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: value == 'Select Taste' ? AppColors.grey : AppColors.black,
            ),
          ),
        );
      }).toList(),
      isExpanded: true,
    );
  }

}
