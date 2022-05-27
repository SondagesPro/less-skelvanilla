#!/bin/bash
# Script to make variation, need npm and some extra
# npm install less -g
# npm install clean-css-cli -g
if [ "$#" -lt 1 ]; then
   echo "Usage : makevariation-variables.sh variablename [theme]"
   exit 1;
fi
variablename="$1";

if [ "$#" -lt 2 ]; then
    defaulttheme="button_awesome"
else
    defaulttheme=$2
fi

themes=(theme-base theme-button theme-awesome theme-button_awesome )

mkdir variations

# reset to default to make default theme
cat skelvanilla-default/variables-init.less > variables-init.less
cat skelvanilla-default/variables.less > variables.less
cat skelvanilla-default/variables-skelvanilla.less > variables-skelvanilla.less
cat skelvanilla-default/variables-select2.less > variables-select2.less
cat skelvanilla-default/variables-moreselect2.less > variables-moreselect2.less
cat skelvanilla-default/variables-slider.less > variables-slider.less
cat skelvanilla-default/variables-button-item.less > variables-slider.less
cat skelvanilla-default/customization-bootswatch.less > customization-bootswatch.less
cat skelvanilla-default/customization-extra.less > customization-extra.less

# make default theme

if [ -r variablesnames/${variablename}/variables.less ];
then
    cat variablesnames/${variablename}/variables.less > variables.less
fi
if [ -r variablesnames/${variablename}/variables-init.less ];
then
    cat variablesnames/${variablename}/variables-init.less > variables-init.less
fi
if [ -r variablesnames/${variablename}/variables-skelvanilla.less ];
then
    cat variablesnames/${variablename}/variables-skelvanilla.less > variables-skelvanilla.less
fi
if [ -r variablesnames/${variablename}/variables-select2.less ];
then
    cat variablesnames/${variablename}/variables-select2.less > variables-select2.less
fi
if [ -r variablesnames/${variablename}/variables-moreselect2.less ];
then
    cat variablesnames/${variablename}/variables-moreselect2.less > variables-moreselect2.less
fi
if [ -r variablesnames/${variablename}/variables-slider.less ];
then
    cat variablesnames/${variablename}/variables-slider.less > variables-slider.less
fi
if [ -r variablesnames/${variablename}/variables-button-item.less ];
then
    cat variablesnames/${variablename}/variables-button-item.less > variables-button-item.less
fi
if [ -r variablesnames/${variablename}/customization-bootswatch.less ];
then
    cat variablesnames/${variablename}/customization-bootswatch.less > customization-bootswatch.less
fi
if [ -r variablesnames/${variablename}/customization-extra.less ];
then
    cat variablesnames/${variablename}/customization-extra.less > customization-extra.less
fi

## Add your own needed variables files here , sample
# cat variablesnames/variations-variables/myownvariables.less > variables.less
# cat variablesnames/variations-extra/myownvariables.less > variables.less
for theme in "${themes[@]}"
do
    themename=${theme/theme/$variablename}
    lessc ${theme}.less variations/${themename}.css
    cleancss variations/${themename}.css > variations/${themename}.min.css
    rm variations/${themename}.css
done
# Make lsbootstrap.css with awesome button
lessc --source-map --source-map-rootpath=https://gitlab.com/SondagesPro/SurveyThemes/less-limesurvey/raw/master/ "theme-${defaulttheme}.less" bootstrap.css

# remove working files
rm variables-init.less
rm variables.less
rm variables-slider.less
rm variables-select2.less
rm variables-moreselect2.less
rm variables-skelvanilla.less
rm customization-extra.less
rm customization-bootswatch.less

echo "All variations done, you can copy boostrap.css, bootstrap.css.map and variations directiry to your css directory in Skelvanilla LimeSurvey theme"
