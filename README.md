# Basic less generator for LimeSurvey #

Updated from bootstrap

- Allow usage of rem
- Set current font-size to rem
- Add more usage of current variable to make different variations
- Some fix for limesurvey with bootsrap

The default variables use only rem and more contrast

## Usage ##

### Single bootstrap replace ##

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
5. Move variations directory and bootstrap.css to your [skelvanilla](https://gitlab.com/SondagesPro/SurveyThemes/skelvanilla) extended model
6. Add your own variation in [skelvanilla](https://gitlab.com/SondagesPro/SurveyThemes/skelvanilla) config.xml file at `availablevariations` part.

### Single variation creation ##

With `makevariation-variables.sh` you can create your own boostrap.css and the related variation. It's the simpliest way to get needed file for your template.

1. Create a directory in `variablesnames` directory
2. Put your own variables.less in this directory
3. Add other files (see `skelvanilla-default` directory for used files)
4. Launch script : `sh makevariation-variables.sh variablename [theme]` (default theme is `button_awesome`)
5. Replace boostrap.css in skelvanilla extended version
6. Add variations directory in skelvanilla extended version
5. Update skelvanilla extended version **Available variation** at global level to 
```
{
  "variablename": {
    "name": "Variable Name",
    "base": "1",
    "button": "1",
    "awesome": "1",
    "button_awesome": "1"
  }
}
```


