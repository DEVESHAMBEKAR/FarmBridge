import os

files = [
    'lib/features/auth/presentation/buyer_profile_setup_screen.dart',
    'lib/features/auth/presentation/farmer_profile_setup_screen.dart',
    'lib/features/auth/presentation/logistics_profile_setup_screen.dart'
]

for file_path in files:
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # 1. Add imports
    if 'package:geolocator/geolocator.dart' not in content:
        content = content.replace("import 'package:flutter/material.dart';", "import 'package:flutter/material.dart';\nimport 'package:geolocator/geolocator.dart';\nimport 'package:geocoding/geocoding.dart';")

    # 2. Add variables
    if 'double? _latitude;' not in content:
        content = content.replace(
            "final _formKey = GlobalKey<FormState>();", 
            "final _formKey = GlobalKey<FormState>();\n  double? _latitude;\n  double? _longitude;\n  bool _isGettingLocation = false;"
        )

    # 3. Add getLocation method
    address_controller = '_addressController'
    if 'farmer' in file_path:
        address_controller = '_farmAddressController'
    elif 'logistics' in file_path:
        # logistics uses _serviceAreaController for areas, doesn't have an address controller explicitly in the same way, but let's check
        pass
    
    get_location_code = f"""
  Future<void> _getCurrentLocation() async {{
    setState(() => _isGettingLocation = true);
    try {{
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {{
        permission = await Geolocator.requestPermission();
      }}
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {{
        final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        _latitude = position.latitude;
        _longitude = position.longitude;
        
        final placemarks = await Geocoding().placemarkFromCoordinates(position.latitude, position.longitude);
        if (placemarks.isNotEmpty) {{
          final place = placemarks.first;
          setState(() {{
            if (this.mounted) {{
              {address_controller if 'logistics' not in file_path else '/* logistics area logic */'} = TextEditingController(text: '${{place.street}}, ${{place.subLocality}}');
            }}
          }});
        }}
      }}
    }} catch (e) {{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to get location: $e')));
    }} finally {{
      if (mounted) setState(() => _isGettingLocation = false);
    }}
  }}
"""
    if '_getCurrentLocation' not in content:
        content = content.replace(
            "void dispose() {",
            get_location_code + "\n  @override\n  void dispose() {"
        )
        
        # for buyer and farmer, add _addressController logic properly
        if 'buyer' in file_path or 'farmer' in file_path:
            content = content.replace(
                f"{address_controller}.text = '", 
                f"{address_controller}.text = '"
            ) # Just a safe replace
            
            # fix the state setting logic
            content = content.replace(
                f"{address_controller} = TextEditingController",
                f"{address_controller}.text = '${{place.street ?? ''}} ${{place.subLocality ?? ''}}'.trim();\n              if (place.locality != null) _cityController.text = place.locality!;\n              if (place.postalCode != null) _pincodeController.text = place.postalCode!;"
            )
            
    # 4. Add UI button
    ui_button = """
                  OutlinedButton.icon(
                    onPressed: _isGettingLocation ? null : _getCurrentLocation,
                    icon: _isGettingLocation ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.my_location),
                    label: const Text('Use Current Location'),
                  ),
                  const SizedBox(height: 16),
"""
    if 'Use Current Location' not in content:
        if 'buyer' in file_path:
            content = content.replace(
                "// Address",
                "// Address\n" + ui_button
            )
        elif 'farmer' in file_path:
            content = content.replace(
                "// Farm Address",
                "// Farm Address\n" + ui_button
            )
        elif 'logistics' in file_path:
            pass # Skip UI button for logistics for now as it uses service areas

    # 5. Pass lat/long to saveProfile
    if 'buyer' in file_path:
        content = content.replace(
            "saveProfile(profile, _nameController.text.trim());",
            "saveProfile(profile, _nameController.text.trim(), latitude: _latitude, longitude: _longitude);"
        )
    elif 'farmer' in file_path:
        content = content.replace(
            "saveProfile(profile, _nameController.text.trim());",
            "saveProfile(profile, _nameController.text.trim(), latitude: _latitude, longitude: _longitude);"
        )
    elif 'logistics' in file_path:
        content = content.replace(
            "saveProfile(profile, _nameController.text.trim());",
            "saveProfile(profile, _nameController.text.trim(), latitude: _latitude, longitude: _longitude);"
        )

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)

print("Updated setup screens!")
