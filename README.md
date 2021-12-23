## India-Today Flutter Developer Assignment

## Run app 

Download apk from [here](https://github.com/amanv8060/astrotak-assignment/tree/main/apk)

### Steps to build and run :

1. Clone repo `git clone https://github.com/amanv8060/astrotak-assignment`
2. cd astrotak-assignment
3. run `flutter pub get`
4. run `flutter run`

Additional Steps (to contribute)

4. chmod +x pre-commit
5. cp pre-committ .git/hooks/


Quick Overview of Project:
```
📦lib
 ┣ 📂models
 ┃ ┣ 📂agent
 ┃ ┃ ┣ 📜api_image.dart
 ┃ ┃ ┣ 📜availbility.dart
 ┃ ┃ ┣ 📜images.dart
 ┃ ┃ ┣ 📜language.dart
 ┃ ┃ ┣ 📜skill.dart
 ┃ ┃ ┗ 📜slot.dart
 ┃ ┣ 📂panchang
 ┃ ┃ ┣ 📜end_time.dart
 ┃ ┃ ┣ 📜hindu_maah.dart
 ┃ ┃ ┣ 📜karan.dart
 ┃ ┃ ┣ 📜karan_details.dart
 ┃ ┃ ┣ 📜muhurta.dart
 ┃ ┃ ┣ 📜nakshatra.dart
 ┃ ┃ ┣ 📜nakshatra_details.dart
 ┃ ┃ ┣ 📜nakshool.dart
 ┃ ┃ ┣ 📜tithi.dart
 ┃ ┃ ┣ 📜tithi_details.dart
 ┃ ┃ ┣ 📜yog.dart
 ┃ ┃ ┗ 📜yog_details.dart
 ┃ ┣ 📜agent.dart
 ┃ ┣ 📜api_response.dart
 ┃ ┣ 📜panchang.dart
 ┃ ┣ 📜place_model.dart
 ┃ ┗ 📜provider_response.dart
 ┣ 📂provider
 ┃ ┣ 📜agent_provider.dart
 ┃ ┣ 📜panchang_provider.dart
 ┃ ┗ 📜place_provider.dart
 ┣ 📂repository
 ┃ ┣ 📜agent_repository.dart
 ┃ ┣ 📜panchang_repository.dart
 ┃ ┗ 📜place_repository.dart
 ┣ 📂screens
 ┃ ┣ 📂ask_question
 ┃ ┃ ┗ 📜ask_question.dart
 ┃ ┣ 📂mainscreen
 ┃ ┃ ┣ 📂widgets
 ┃ ┃ ┃ ┣ 📜app_bar.dart
 ┃ ┃ ┃ ┗ 📜bottom_navigation_items.dart
 ┃ ┃ ┗ 📜main_screen.dart
 ┃ ┣ 📂panchang
 ┃ ┃ ┣ 📂widgets
 ┃ ┃ ┃ ┣ 📜date_location_picker.dart
 ┃ ┃ ┃ ┣ 📜hindu_maah_widget.dart
 ┃ ┃ ┃ ┣ 📜karan_widget.dart
 ┃ ┃ ┃ ┣ 📜mini_info_card.dart
 ┃ ┃ ┃ ┣ 📜mini_info_row.dart
 ┃ ┃ ┃ ┣ 📜muhurta_widget.dart
 ┃ ┃ ┃ ┣ 📜nakshatra_widget.dart
 ┃ ┃ ┃ ┣ 📜panchang_body.dart
 ┃ ┃ ┃ ┣ 📜panchang_header.dart
 ┃ ┃ ┃ ┣ 📜text_row.dart
 ┃ ┃ ┃ ┣ 📜tithi_widget.dart
 ┃ ┃ ┃ ┗ 📜yog_widget.dart
 ┃ ┃ ┗ 📜panchang_screen.dart
 ┃ ┣ 📂profile
 ┃ ┃ ┗ 📜profile_screen.dart
 ┃ ┣ 📂reports
 ┃ ┃ ┗ 📜reports.dart
 ┃ ┗ 📂talk_to_astrologer
 ┃ ┃ ┣ 📂functions
 ┃ ┃ ┃ ┣ 📜agent_language.dart
 ┃ ┃ ┃ ┣ 📜agent_skills.dart
 ┃ ┃ ┃ ┗ 📜filter_agents.dart
 ┃ ┃ ┣ 📂widgets
 ┃ ┃ ┃ ┣ 📜agent_card.dart
 ┃ ┃ ┃ ┣ 📜agent_filter.dart
 ┃ ┃ ┃ ┣ 📜sort_menu.dart
 ┃ ┃ ┃ ┣ 📜talk_to_astrologer_body.dart
 ┃ ┃ ┃ ┗ 📜talk_to_astrologer_header.dart
 ┃ ┃ ┗ 📜talk_to_astro_screen.dart
 ┣ 📂services
 ┃ ┗ 📜network_service.dart
 ┣ 📂utils
 ┃ ┣ 📂get_it
 ┃ ┃ ┗ 📜locator.dart
 ┃ ┣ 📂logging
 ┃ ┃ ┣ 📜custom_logger.dart
 ┃ ┃ ┗ 📜info_toast.dart
 ┃ ┣ 📂network
 ┃ ┃ ┣ 📜network_common.dart
 ┃ ┃ ┗ 📜request_helper.dart
 ┃ ┣ 📂theme
 ┃ ┃ ┗ 📜app_theme.dart
 ┃ ┣ 📜constants.dart
 ┃ ┣ 📜size_config.dart
 ┃ ┗ 📜sort_agents.dart
 ┣ 📜app.dart
 ┣ 📜generated_plugin_registrant.dart
 ┗ 📜main.dart
```
