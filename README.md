# Basic less generator for LimeSurvey #

Updated from boostrap

- Allow usage of rem
- Set current font-size to rem
- Add more usage of current variable top make different variations
- Some fix for limesurvey with bootsrap

The default variables use only rem and more contrast

## Usage ##

### Single boostrap replace ##

1. Copy file from  skelvanilla-default directory to base directory
2. Update `variables.less` and optionnaly other less files. If you already have a variables.less file : you can use it directly.
3. Use lessc to generate your theme : you can choose the theme varivation between base, awesome, button and awesome_button
4. `lessc theme-base.less > bootstrap.css`
5. Copy this css file to your [skelvanilla](https://gitlab.com/SondagesPro/SurveyThemes/skelvanilla) extended model

### Complete variation creation ##

1. Put your variables.less file in variations-variables directory with your desired name (sample : `mytheme.less`)
2. Optionaly remove all other files from variations-variables directory (then your template get it by parent theme)
2. Optionnaly create adapted less file in other directory (see default directory for usage)
3. Update makevariations.sh script after `## Add your own needed variables files here` line to use your own less file for default
4. Update `lessc` generator line to use your prefered theme.
5. Move variations directory and boostrap.css to your [skelvanilla](https://gitlab.com/SondagesPro/SurveyThemes/skelvanilla) extended model
6. Add your own variation in [skelvanilla](https://gitlab.com/SondagesPro/SurveyThemes/skelvanilla) config.xml file at `availablevariations` part.
